# Change: Revise Super Cancel into MAX Chain

## Why

The current Super Cancel implementation opens only when a special or super is
displaying the move-table `MoveEnd` offset and both player hitboxes are zero.
That condition is too narrow for expressive play and is not reliable across the
roster: `MoveEnd` is a move-specific target, not a guaranteed final recovery
frame. Ryo's Ko-Ou Ken demonstrates the failure directly because its `$08`
target still has an attack hitbox while its actual recovery continues through
later frames, leaving no frame that can pass both checks.

The mode should reward MAX-state routing and experimentation. Cancels should
become available once the source move has committed to its attack, remain
available through its active and recovery phases, and use explicit resource,
chain, and damage rules instead of an unreliable animation-offset heuristic.

## What Changes

- Rename the OPTION item from `SUP CANCEL` to `MAX CHAIN`, retaining its
  independent DIP bit and disabled default.
- Replace the final-frame/no-hitbox predicate with a latched source-move phase:
  an attack-bearing special becomes cancellable as soon as its first regular or
  forced hitbox appears and stays cancellable for the rest of that move.
- Open the same window when the current move records a direct or projectile hit
  or guard confirmation. For specials that never produce a player hitbox, open
  after their first completed animation transition unless the source is unsafe.
- Permit special-to-special, special-to-super, and super-to-special routes.
  Reject super-to-super routes, a consecutive route into the same move family,
  and a third cancel in the same chain.
- Keep normal target-move legality checks and reject cancels while a throw,
  grab rotation, or other opponent-locking sequence is in progress.
- Treat the remaining MAX meter as a consumable cancel resource: ordinary
  special-to-special links cost `$08`; any permitted link involving a super
  costs `$10`.
- Scale all damage components of the first cancelled-into move to three
  quarters and the second to one half, always from each target move's original
  damage rather than compounding prior scaling.
- Preserve prior gameplay when `MAX CHAIN` is disabled.

## Impact

- Affected spec: `kof96-super-cancel` (revised as MAX Chain)
- Affected code: `src/constants.asm`, `src/memory.asm`, `src/bank00.asm`,
  `src/bank01.asm`, collision/character move code where confirmation or unsafe
  source handling is required, `src/bank1C.asm`, build documentation, workflow
  artifact naming, and ROM artifacts
- Compatibility: no save-format change; the DIP bit remains independent and
  defaults off
- Validation: deterministic builds and static state checks are necessary but
  not sufficient; roster-level emulator playtesting is required before the
  change may be marked complete
