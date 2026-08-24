## Validation

- Toolchain: pinned RGBDS 0.7.0.
- Japanese ROM: deterministic SHA-1
  `5f00e42bfbb446ef33eef9e0b1e0b772c68a3606` and SHA-256
  `5e08171e776fae3257ebe5c28510eff81db1f75508dcc93d65e0b30afd828be6`;
  header checksum `C6`, global checksum `5FBC`.
- English ROM: deterministic SHA-256
  `31bec4f5b68306341716e00bdf8cf945e1b15a78bd6935cc55abe1173c00105e`;
  header checksum `CD`, global checksum `900D`.
- The Super Cancel validator begins with machine code that checks DIP bit 0,
  reads logical `iPlInfo_Pow` at offset `$50`, and compares it with
  `PLAY_POW_MAX` (`$28`) before hitbox and final-frame checks. This gate contains
  no POW write or subroutine call, so failed and successful prerequisite checks
  do not themselves consume meter.
- The ROM DIP table is exactly `08 3F 99 04 5F 99 01 7F 99 20 9F 99 C0 BF
  99 10 1F 9A`; Super Cancel therefore uses independent bit 0 and the Japanese
  default `$C0` leaves it disabled.
- The damage-divider implementation matches `0` for zero and
  `max(1, floor(value / 3))` for every input from 1 through 255.
- Initial move-table damage and both common current/pending damage setters are
  scaled. Projectile setup copies the already-scaled pending fields; the only
  direct projectile-damage writes outside that path set damage to zero.
- Standing and crouching normal input code is byte-identical to the prior
  Super Cancel ROM, with SHA-256 values
  `b013bbab615fc318293285b9bdb8ee93dccdb5cd889dc36faf0fce4c3a392dba`
  and `bcc49620190bd85c8a0305a297d098d1ce985279bb090b446797cdd740edf7dc`.
  The prior relocation-aware comparison against the original ROM remains valid
  because the full-POW gate was added after these routines.
- `bank03.asm` remains unchanged. The COM AI machine-code region is
  byte-identical to the prior Super Cancel ROM, SHA-256
  `c044146569c53411aa7c18e8753068468213071e4f8a92638f2e12d0c9a49a02`.
- Japanese and English builds, `git diff --check`, `bash -n build.sh`, workflow
  YAML parsing, `shell.nix` parsing, ROM size, and both ROM checksum algorithms
  pass.

No Game Boy emulator or hardware runner is installed in the available
environment. Full-POW runtime gating, recovery-window timing, roster-specific
final-frame behavior, and play feel therefore remain runtime playtest items
rather than claimed dynamic evidence.
