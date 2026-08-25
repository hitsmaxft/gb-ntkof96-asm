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
`ntkof96-options-all-dips-max-chain-ai-fixed-select-tap-specials`
artifact. It contains the `.gb` file and `SHA256SUMS`.

## Modified Japanese build

The Japanese configuration builds a gameplay-options edition with all hidden
fighters unlocked by default. The OPTION screen exposes POWER UP, EASY MOVE,
MAX CHAIN, TEAM DUPL, HIDDEN CHR, and SGB TEST toggles alongside the original
time, difficulty, BGM, and SFX settings. HIDDEN CHR controls both the boss and
extra character unlock flags. Punch and kick strength uses the original
tap/hold logic, including for CPU-controlled fighters.

POWER UP matches the original logo cheat by enabling both meter power-up and
duplicate-team DIP flags when switched on; TEAM DUPL may then be adjusted
independently. Directional EASY MOVE shortcuts request heavy moves, so moves
with hidden-heavy variants select them at maximum POW.

SGB TEST can be toggled on any system. On Super Game Boy hardware, enable it
with Right and press A to enter the original SGB sound editor.

MAX CHAIN defaults to `N`. While MAX mode is active, it allows special to
special, special to super, and super to special links only after the current
source's player or owned-projectile hitbox connects with the opponent, including
a guarded connection. The confirmed window remains open for the rest of that
move, so Ryo's Ko-Ou Ken is no longer tied to its incorrect move-table end
offset, but a whiff never opens MAX CHAIN.
Same-family links, super to super, throws, and opponent-locking sequences are
rejected, and a chain is limited to two links. MAX CHAIN applies only to player
input; CPU fighters retain their original AI routing so POWER UP cannot turn
hard COM behavior into an endless super-cancel loop.

Special-to-special links spend `$08` from the visible MAX timer; routes that
cross the special/super boundary spend `$10`. The first chained move deals
`max(1, floor(original * 3 / 4))` damage per non-zero component and the second
deals `max(1, floor(original / 2))`, including later hits and projectiles. A
rejected input does not change the move, timer, or chain state.

With EASY MOVE enabled, `SELECT+A` and `SELECT+B` keep each fighter's original
shortcuts. Hold forward, back, or down relative to the fighter's facing and tap
then release `SELECT` for three additional special moves. Up plus `SELECT` and
neutral `SELECT` are intentionally left unchanged.

## 
Once again, thanks to lazigamer for the debug emulator used to generate the initial CDL.
## 
*it all began in 96...*
