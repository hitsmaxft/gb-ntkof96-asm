## Context

KOF96 marks an executing special with `PF0B_SPECMOVE` and an executing super
with `PF0B_SUPERMOVE`. Starting another special normally fails while the source
special is still active. The engine already tracks current regular and forced
hitboxes, direct-hit cancel state, projectile ownership, MAX duration, current
move ID, and character-specific target legality.

The previous Super Cancel design compared the visible animation offset with
`iPlInfo_OBJLstPtrTblOffsetMoveEnd` while requiring both hitboxes to be zero.
That field is only a move-specific animation target. Custom move code may end on
a later frame, and some moves reuse or truncate animation tables in ways that
make the field unsuitable as a roster-wide recovery marker.

MAX mode keeps `iPlInfo_Pow` at `PLAY_POW_MAX` while the separate
`iPlInfo_MaxPow` value counts down. MAX Chain will consume the latter so the
cost is visible in the existing MAX bar and naturally limits routing time.

## Goals / Non-Goals

- Goals: allow broad special routing after the source actually connects, make
  hit/guard cancels responsive, keep a confirmed window available through
  recovery without exact frame metadata, and balance chains with visible MAX
  cost, depth limits, route restrictions, and moderate damage scaling.
- Goals: retain character-specific target legality and prevent source-state
  corruption during throws, grab rotations, and other opponent-locking moves.
- Non-goals: cancel normals through MAX Chain, redesign ordinary hit cancels or
  guard cancels, add new move commands, redesign CPU tactics, or guarantee that
  no-hitbox utility moves are chainable.

## Decisions

### Mode and resource

- Keep DIP bit 0 but display the option as `MAX CHAIN` with values `N` and `Y`.
- Require `iPlInfo_MaxPow` to contain at least the cost of the requested route.
  This deliberately starts availability when MAX duration exists, rather than
  during a transient logical/visual meter transition.
- Charge `$08` for special-to-special and `$10` for special-to-super or
  super-to-special. Subtract the cost when the target move is committed, not
  when an input is merely examined. An exact-to-zero subtraction must use the
  normal MAX fade/termination path and must not let the periodic decrement wrap
  `iPlInfo_MaxPow` from `$00` to `$FF`.
- A target super retains its ordinary meter, health, and desperation checks.
  MAX Chain adds no exemption.
- Gate source eligibility on player control. The CPU already synthesizes
  character commands through the same readers; allowing it into MAX Chain
  under POWER UP removes the intended resource brake and makes hard COM loop
  special-to-super routes. CPU fighters therefore retain the original AI path.

### Per-source hit confirmation

- Clear confirmation whenever a special starts normally and whenever a MAX
  Chain target is committed. Every link must earn a new connection.
- Latch `HIT_CONFIRMED` for the current source move on a direct hit, blocked
  hit, owned-projectile hit, or owned-projectile blocked hit. Confirmation also
  opens the window, including for a projectile move whose player sprite never
  exposes an attack hitbox.
- Once `HIT_CONFIRMED` is set, keep the window open through the source's later
  active and recovery frames until the source ends or another move starts.
- A merely active hitbox, a whiff, and a no-hitbox utility transition never
  open MAX Chain.
- Do not derive current-source confirmation from
  `PF1B_ALLOWHITCANCEL`. That flag can survive a prior cancel and would let a
  new target cancel again without landing its own hit. Set the per-source bit
  only from the actual direct/projectile collision paths.

### Route and safety rules

- Allow special-to-special, special-to-super, and super-to-special.
- Reject super-to-super in this revision. This avoids nested sparkle, meter,
  invulnerability, and cinematic state until explicitly validated later.
- Reject a target in the same move family as the source, treating light/heavy
  and super/desperation variants as the same family. Use an explicit
  character/move-family mapping or verified input-reader metadata; do not assume
  that clearing a move-ID bit groups every bespoke slot correctly.
- Permit at most two accepted MAX Chain links before the player returns to an
  ordinary move state.
- Reject the source while a shared throw, command throw, grab rotation, or
  opponent-locking multi-hit/cinematic state is active. Prefer dynamic hit-type
  checks; use a small source deny table only for bespoke cases that cannot be
  identified safely from common state.
- Keep existing target checks for no-special status, hit state, dizzy state,
  ground/air status, health, meter, projectile-active state, proximity,
  command throws, and character-specific move availability.
- A still-active projectile does not by itself block cancelling its owner into
  a non-projectile move. Existing target projectile validation continues to
  prevent an illegal second projectile.

### Validation and commit order

- Split source eligibility from target validation. The pre-command check may
  only open a pending window; it cannot determine route type, family, exact
  cost, or target legality before the character reader selects a move ID.
- After a target ID is selected, validate source/target route type, move family,
  depth, exact MAX cost, and ordinary target legality before changing move
  flags, starting animation, or applying character-specific target side
  effects. Character readers may already have consumed the completed command
  buffer before target selection.
- Commit an accepted route atomically: deduct MAX once, increment depth, install
  the target damage tier, clear per-source confirmation, set the target's
  special/super flags exactly, and then initialize the target move.
- A rejected post-command target must return through the reader's no-move path
  without charging MAX, changing the current move, or running target-init
  effects.
- In particular, super-to-special must clear `PF0B_SUPERMOVE`; otherwise the
  target special inherits super flashing, route classification, and end-of-move
  meter behavior. For a super canceled before its ordinary end, the `$10` MAX
  Chain charge replaces the source super's deferred end-of-super meter emptying.

### State representation

Use the existing per-player byte at `$8A`, renamed
`iPlInfo_MaxChainState`, with this logical allocation:

- bit 0: reduced damage is active for the current target move
- bit 1: a validated cancel is pending target initialization
- bit 2: reserved
- bit 3: the current source has hit or been guarded (`HIT_CONFIRMED`)
- bits 4-5: accepted chain depth, from 0 through 2
- bit 6: transiently marks a prevalidated target for the one stack-sensitive
  initializer
- bit 7: the character input-reader context is active

Bytes `$8B` and `$8C` record projectile ownership and the one prevalidated
target move ID respectively. This prevents an older projectile from confirming
a different current source and lets the stack-sensitive Geese Shippu Ken
initializer validate before saving its momentum registers.

The current pending-to-active promotion overwrites the whole byte. Replace it
with bit-preserving updates so phase and chain-depth state are not accidentally
destroyed. A normally started special clears phase, confirmation, depth, and
damage state. A MAX Chain target clears per-source confirmation, preserves and
increments depth, and installs the new damage tier. Move end and round init
clear the entire byte.

### Damage

- Chain depth 1 scales every non-zero damage component to
  `max(1, floor(original * 3 / 4))`.
- Chain depth 2 scales every non-zero damage component to
  `max(1, floor(original / 2))`.
- Zero remains zero so zero-damage and pending-damage sentinels stay valid.
- Apply scaling to initial move-table damage and all common current/pending
  damage writes. Projectile setup must inherit the correct tier, and bespoke
  direct projectile writes must be audited.
- Each target is scaled from its own original damage. Damage does not compound
  from three quarters to three eighths.

## Risks / Trade-offs

- Existing direct-hit cancel flags are combo-scoped rather than source-scoped;
  failing to reset/latch confirmation per move would open false windows.
- Cancelling a captured or cinematic opponent can strand hit-state variables.
  Those states require explicit runtime tests and must remain denied by default.
- Projectile confirmation needs an owner-side signal that the current code does
  not expose through `PF1B_ALLOWHITCANCEL`.
- Strict confirmation means whiffed attacks and no-hitbox utility moves cannot
  MAX Chain. This deliberately trades some routing breadth for predictable
  hit-confirm behavior and prevents repeated evasive cancels.
- The new damage ratios and MAX costs are initial tuning values. Change them as
  named constants after playtesting rather than embedding character-specific
  numbers.

## Migration Plan

1. Replace the old recovery predicate while keeping the DIP disabled by
   default.
2. Add per-source confirmation, depth, cost, and route validation.
3. Update damage scaling and projectile confirmation.
4. Build both revisions and run static state/coverage checks.
5. Playtest representative routes, then the full roster source matrix.
6. Publish new artifacts only after runtime acceptance; the current Super
   Cancel ROM remains the rollback artifact until then.

## Open Questions

- None required to begin implementation. Damage ratios and costs are explicit
  starting values and may be revised from recorded playtest evidence.
