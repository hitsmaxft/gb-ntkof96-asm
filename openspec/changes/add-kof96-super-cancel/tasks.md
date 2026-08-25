## 1. Menu and constants

- [x] 1.1 Rename the OPTION row and documentation from `SUP CANCEL` to
  `MAX CHAIN`, retaining DIP bit 0 and the disabled default.
- [x] 1.2 Define named route costs, depth limits, damage tiers, and MAX Chain
  state bits without embedding tuning values in character code.

## 2. Per-source state

- [x] 2.1 Replace final-frame/no-hitbox recovery validation with per-source
  `HIT_CONFIRMED` state set only by an actual direct or owned-projectile
  connection, including guard.
- [x] 2.2 Latch direct hit and guard confirmation for the current source without
  treating a stale `PF1B_ALLOWHITCANCEL` from a prior move as confirmation.
- [x] 2.3 Add owner-side projectile hit/guard confirmation.
- [x] 2.4 Preserve chain depth during a MAX Chain transition, clear confirmation
  for the new move so every link must connect independently, and reset the whole
  state on normal start, move end, interruption, and round init.
- [x] 2.5 Replace the current whole-byte pending-to-active assignment with
  bit-preserving state updates.

## 3. Route validation and resource cost

- [x] 3.1 Allow special-to-special, special-to-super, and super-to-special after
  the source window opens while preserving all ordinary target legality checks.
- [x] 3.2 Reject super-to-super, the same move family, insufficient MAX
  duration, and links beyond chain depth two using a verified family mapping.
- [x] 3.3 Reject shared throws, command throws, grab rotations, and
  opponent-locking cinematic states; add only evidence-backed bespoke source
  exceptions.
- [x] 3.4 Charge `$08` or `$10` exactly once when the target is committed and
  never for a failed or merely parsed attempt; terminate MAX safely rather than
  underflowing when the cost consumes the exact remaining duration.
- [x] 3.5 Split pre-command source eligibility from post-command target
  validation so rejection reaches the no-move path before target-init effects,
  animation changes, or resource writes.
- [x] 3.6 Set target special/super flags exactly, including clearing
  `PF0B_SUPERMOVE` on super-to-special and replacing the canceled source super's
  deferred meter emptying with the `$10` route charge.
- [x] 3.7 Exclude CPU-controlled fighters from MAX Chain source eligibility so
  POWER UP cannot produce a hard-COM super-cancel loop.

## 4. Damage

- [x] 4.1 Replace one-third scaling with depth-one three-quarter and depth-two
  one-half scaling, preserving zero and a minimum non-zero value of one.
- [x] 4.2 Scale initial, current, pending, multi-hit, and projectile damage from
  each target move's original values without compounding tiers.
- [x] 4.3 Audit bespoke projectile and direct-damage writes outside the common
  setters.

## 5. Verification and delivery

- [ ] 5.1 Add static tests for strict per-source confirmation, whiff rejection, route
  matrix, same-family grouping, chain reset, costs, and all damage inputs.
- [ ] 5.2 Generate a roster source-coverage report classifying every implemented
  special/super by direct/projectile confirmation path or denied/exceptional.
- [ ] 5.3 Rebuild Japanese and English variants with pinned RGBDS 0.7.0 and
  verify deterministic ROM/header checksums and disabled-mode equivalence.
- [ ] 5.4 Emulator-test representative hit, guard, whiff, confirmed recovery,
  projectile, utility rejection, throw, multi-hit, super, and two-link routes.
- [ ] 5.5 Complete a roster-level emulator pass, record remaining physical
  hardware limits separately, then update README, artifact naming, hashes, and
  release packaging.
