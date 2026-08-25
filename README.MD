# kof96

Disassembly of The King of Fighters '96 for the Game Boy, also known as:
* 熱闘 ザ・キング・オブ・ファイターズ ’９６
* Nettou King of Fighters '96
* The King of Fighters: Heat of Battle

## Building
This will build bit-perfect ROMs of the Japanese and English versions of KOF96.

To assemble, run one of the included batch scripts:
- **build-jp.cmd** for the Japanese version. To verify this, provide a ROM named "*Nettou The King of Fighters '96 (Japan) (SGB Enhanced).gb*" as "*original_jp.gb*". `sha1: 63F25BFF422A591907B83AB9F14709E938172839`
- **build-en.cmd** for the English version. To verify this, provide a ROM named "*King of Fighters, The - Heat of Battle (Europe) (SGB Enhanced).gb*" as "*original_en.gb*". `sha1: 1B5AC034B1333B3340FBDC5C128BC12ABD310043`
- **build-nojunk.cmd** for a version of the game without padding areas. Currently, it builds a Japanese-language version running on the English version's engine.

On Unix-like systems, enter the pinned RGBDS 0.7.0 environment and use the
portable build script:

```sh
nix-shell
./build.sh jp
```

GitHub Actions also builds the modified ROM on every push and pull request.
Run **Build modified ROM** manually from the Actions page when needed, then
download the
`ntkof96-options-all-dips-full-pow-super-cancel-ai-fixed-select-tap-specials`
artifact. It contains the `.gb` file and `SHA256SUMS`.

## Modified Japanese build

The Japanese configuration builds a gameplay-options edition with all hidden
fighters unlocked by default. The OPTION screen exposes POWER UP, EASY MOVE,
SUP CANCEL, TEAM DUPL, HIDDEN CHR, and SGB TEST toggles alongside the original
time, difficulty, BGM, and SFX settings. HIDDEN CHR controls both the boss and
extra character unlock flags. Punch and kick strength uses the original
tap/hold logic, including for CPU-controlled fighters.

POWER UP matches the original logo cheat by enabling both meter power-up and
duplicate-team DIP flags when switched on; TEAM DUPL may then be adjusted
independently. Directional EASY MOVE shortcuts request heavy moves, so moves
with hidden-heavy variants select them at maximum POW.

SGB TEST can be toggled on any system. On Super Game Boy hardware, enable it
with Right and press A to enter the original SGB sound editor.

SUP CANCEL defaults to `N`. When enabled, a special or super may cancel into
another legal special or super only while the logical POW meter is full, after
its visible attack animation has finished, and once both attack hitboxes are
gone. The full-POW check itself does not consume meter; the target move keeps
its ordinary meter behavior. Every non-zero damage component of the
cancelled-into move, including later hits and projectiles, becomes
`max(1, floor(original / 3))`. Each chained Super Cancel requires full POW
again and scales the new move from its own original damage.

With EASY MOVE enabled, pressing `SELECT` uses the fighter's original ground
`SELECT+A` shortcut by default. `SELECT+A` and `SELECT+B` still choose the two
original shortcuts, including each fighter's airborne `SELECT+A` assignment
while jumping. Holding forward, back, or down relative to the fighter's facing
chooses one of three additional ground moves. Release `SELECT` before 6 frames
for the light version, or hold it for 6 frames for the corresponding heavy
version.

## 
Once again, thanks to lazigamer for the debug emulator used to generate the initial CDL.
## 
*it all began in 96...*
