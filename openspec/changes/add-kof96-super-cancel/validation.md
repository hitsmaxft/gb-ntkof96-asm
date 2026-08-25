## Validation Status

MAX Chain is implemented and both full Japanese and English ROM variants
assemble with pinned RGBDS 0.7.0. Static/build evidence does not complete the
emulator acceptance matrix; roster gameplay validation remains open and no
physical-hardware claim is made.

Current build artifacts:

- Japanese `kof96.gb`: SHA-256
  `77807a112d10859a518754b2d9718be2b8f6dee044cb2505a57f42aa4cfd2341`,
  SHA-1 `d819d0a3e448849b83fdf899282b24b19655bb3d`, header checksum
  `$C6`, global checksum `$7B40`
- English validation build: SHA-256
  `b02d81cf625d4d983b27dbe7f2fca4be373d1a6e2e6eb9527c7d966152af6ba6`,
  SHA-1 `dcf841c9abe1bc4dd20a6d5e57536c2efb198090`, header checksum
  `$CD`, global checksum `$D158`
- Both are 524288 bytes and pass independent header/global checksum
  recalculation. Two clean Japanese rebuilds were byte-identical.

## Confirmed Current-Design Failure

- The old validator requires both a zero current hitbox and visible animation
  offset equality with `iPlInfo_OBJLstPtrTblOffsetMoveEnd`.
- Ryo's light and heavy Ko-Ou Ken entries store `$08` as that target.
- Visible frame `$08` still uses hitbox `COLIBOX_2C`, while later `$0C` and `$10`
  recovery frames no longer equal the target. The move ends from custom code on
  frame `$10`.
- Therefore no Ko-Ou Ken frame can satisfy both old conditions. This is a
  deterministic source and current-ROM finding, not an input-timing inference.

## Static Acceptance Plan

- Verify `MAX CHAIN` keeps independent DIP bit 0 and defaults to `N`.
- Verify CPU-controlled fighters never enter MAX Chain, including hard COM with
  both POWER UP and MAX CHAIN enabled.
- Verify disabled mode does not change input-reader, damage, MAX duration, or
  move-route behavior relative to the prior options build.
- Exhaustively test the route matrix:
  - special-to-special accepted at cost `$08`;
  - special-to-super and super-to-special accepted at cost `$10`;
  - super-to-super rejected;
  - same-family light/heavy and super/desperation routes rejected;
  - third links rejected.
- Verify startup remains locked, the first hitbox frame opens immediately,
  later active and recovery frames remain open, and no comparison with
  `iPlInfo_OBJLstPtrTblOffsetMoveEnd` is required.
- Verify `ACTIVE_SEEN` is latched without a cancel attempt on the active frame,
  then permits the player's first attempt during later recovery.
- Verify direct and projectile hit/guard confirmation belongs to the current
  source and cannot leak from a prior normal or prior chain link.
- Verify failed parsing, target illegality, insufficient MAX, denied sources,
  and depth rejection do not charge MAX duration.
- Verify accepted routes charge exactly once and update the visible MAX target.
- Verify exact-to-zero cost follows the MAX fade/termination path and never lets
  the periodic decrement wrap `iPlInfo_MaxPow` to `$FF`.
- Verify post-command route rejection returns before character-specific target
  effects, move animation, or MAX state are changed. The completed command may
  already have been removed from the reader buffer before target selection.
- Verify super-to-special clears `PF0B_SUPERMOVE`, does not retain super sparkle
  or end-of-move behavior, and uses the `$10` route charge in place of the
  canceled source super's deferred meter emptying.
- Exhaustively test damage values 0 through 255 for both tiers:
  - depth 1: zero or `max(1, floor(value * 3 / 4))`;
  - depth 2: zero or `max(1, floor(value / 2))`.
- Verify initial, current, pending, later multi-hit, and projectile paths use the
  correct tier and reset after the chain ends.
- Produce a roster report with one classification for every reachable special
  and super source: `ACTIVE_SEEN`, `UTILITY_READY`, or denied/exceptional.

## Emulator Acceptance Matrix

At minimum, record commands, source/target move IDs, frame/phase, hit state,
chain depth, MAX before/after, and damage before/after for these cases:

- Ryo Ko-Ou Ken into Ko Hou during its first and second active frames, on hit,
  on guard, on whiff, and during both recovery frames.
- An ordinary projectile special into a legal non-projectile move while the
  projectile remains active.
- A projectile-confirmed route whose owner sprite has no active player hitbox.
- A safe no-hitbox utility move before and after its first animation transition.
- A command throw and an opponent-locking multi-hit/cinematic move, both of
  which must remain denied while locked.
- A special-to-super route and a super-to-special route with exact `$10` cost.
- Two different accepted links followed by a rejected third link.
- Same-family L-to-H, H-to-L, S-to-D, and D-to-S attempts, all rejected.
- Option disabled, insufficient MAX duration, interrupted source, round reset,
  and normal post-chain move damage.

## Build and Artifact Gates

- Build Japanese and English variants with pinned RGBDS 0.7.0.
- Pass `git diff --check`, shell/workflow syntax checks, ROM size validation,
  header checksum validation, and deterministic rebuild comparison.
- Record build SHA-1/SHA-256 and global/header checksums as static evidence;
  do not promote them to release-acceptance evidence until the runtime matrix
  passes.
- Keep emulator evidence, physical hardware evidence, and static/build evidence
  separate. Physical hardware is desirable but not a substitute for the
  required roster-level emulator matrix.
