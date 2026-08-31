## 1. Menu and state

- [x] 1.1 Assign the Super Cancel DIP bit and add the `SUP CANCEL` OPTION row.
- [x] 1.2 Add per-player pending/active reduced-damage state and clear it at the
  correct move and round boundaries.

## 2. Cancel and damage logic

- [x] 2.1 Gate every Super Cancel attempt on
  `iPlInfo_Pow == PLAY_POW_MAX` without consuming POW in the gate itself.
- [x] 2.2 Add final non-attacking recovery-window validation without weakening
  normal special/super legality checks.
- [x] 2.3 Start only valid specials or supers from the window and mark the new
  move as reduced damage.
- [x] 2.4 Scale initial, current, pending, projectile, and multi-hit damage to the
  specified integer one-third value.

## 3. Verification and delivery

- [x] 3.1 Rebuild Japanese and English variants with pinned RGBDS 0.7.0 and verify
  deterministic ROM/header checksums.
- [x] 3.2 Re-run original standing/crouching normal and COM AI byte comparisons.
- [x] 3.3 Verify menu DIP masks, full-POW and recovery gating, non-consuming
  failed attempts, normal mode equivalence, and reduced-damage paths statically;
  record emulator/hardware playtest limits.
- [x] 3.4 Update GitHub artifact packaging, copy the final ROM to `graphs`, and
  publish SHA-1 and SHA-256.
