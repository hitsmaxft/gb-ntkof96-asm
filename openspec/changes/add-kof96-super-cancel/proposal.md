# Change: Add KOF96 Super Cancel Mode

## Why

The modified KOF96 ROM already exposes gameplay DIP options, but special moves
remain fully committed through their recovery. A selectable Super Cancel mode
will allow recovery-to-special routing while balancing the cancelled move with
both a full-POW prerequisite and reduced damage.

## What Changes

- Add a `SUP CANCEL` item to the OPTION menu, backed by an unused DIP bit and
  disabled by default.
- Require the player's logical POW meter to be exactly full when attempting a
  Super Cancel. The prerequisite itself does not consume POW; the move started
  by the cancel retains its ordinary meter behavior.
- While enabled, allow a special or super move to start during the final,
  non-attacking recovery frame of another special or super move only when the
  full-POW prerequisite is satisfied.
- Preserve normal move legality checks, including super-meter, health,
  projectile, command-throw, hit-state, and no-special restrictions.
- Scale every damage component of the newly cancelled-into move, including
  projectile and multi-hit damage, to one third using integer damage units.
- Keep normal attacks, ordinary hit cancels, guard cancels, and behavior while
  the option is disabled or the POW meter is not full unchanged.

## Impact

- Affected specs: `kof96-super-cancel` (new)
- Affected code: `gb-ntkof96-asm/src/constants.asm`, `src/memory.asm`,
  `src/bank00.asm`, `src/bank1C.asm`, build documentation and ROM artifact
- Compatibility: no save-format change; the new mode defaults off, while the
  existing hidden-character defaults and other OPTION values remain intact
