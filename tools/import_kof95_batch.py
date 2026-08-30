#!/usr/bin/env python3
"""Import additional KOF95 fighters into KOF96-compatible expansion banks."""

from __future__ import annotations

import argparse
import re
import shutil
import subprocess
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
VENDOR = ROOT.parent / "kof95"
EXPECTED_VENDOR_COMMIT = "d1a2372dbfc474ddcbb94a69ffdb4546a8d5ed08"

FIGHTERS = {
    "benimaru": {
        "class": "Benimaru",
        "icon": 1,
        "code_bank": "bank02.asm",
        "code_start": "MoveC_Benimaru_ThrowG:",
        "code_end": "; =============== MoveC_Ryo_ThrowG",
        "specials": [
            "MOVE_BENIMARU_RAIJINKEN_L", "MOVE_BENIMARU_RAIJINKEN_H",
            "MOVE_BENIMARU_SHINKUU_KATATE_GOMA_L", "MOVE_BENIMARU_SHINKUU_KATATE_GOMA_H",
            "MOVE_BENIMARU_IAI_GERI_L", "MOVE_BENIMARU_IAI_GERI_H",
            "MOVE_BENIMARU_SUPER_INAZUMA_KICK_L", "MOVE_BENIMARU_SUPER_INAZUMA_KICK_H",
        ],
        "super": "MOVE_BENIMARU_RAIKOUKEN_S",
        "easy": "mMvIn_ChkEasyDir MoveInit_Benimaru_Raijinken, MoveInit_Benimaru_SuperInazumaKick, MoveInit_Benimaru_IaiGeri, MoveInit_Benimaru_ShinkuuKatateGoma, MoveInit_Benimaru_Raijinken, MoveInit_Benimaru_Raikouken, MoveInputReader_Benimaru_NoMove",
    },
    "yuri": {
        "class": "Yuri",
        "icon": 3,
        "code_bank": "bank02.asm",
        "code_start": "MoveC_Yuri_ThrowG:",
        "code_end": "; =============== MoveC_Kim_ThrowG",
        "specials": [
            "MOVE_YURI_KO_OU_KEN_L", "MOVE_YURI_KO_OU_KEN_H",
            "MOVE_YURI_SAI_HA_L", "MOVE_YURI_SAI_HA_H",
            "MOVE_YURI_HYAKU_RETSU_BINTA_L", "MOVE_YURI_HYAKU_RETSU_BINTA_H",
            "MOVE_YURI_KUU_GA_L", "MOVE_YURI_KUU_GA_H",
            "MOVE_YURI_RAI_OH_KEN_L", "MOVE_YURI_RAI_OH_KEN_H",
            "MOVE_YURI_HAOH_SHOUKOU_KEN_L", "MOVE_YURI_HAOH_SHOUKOU_KEN_H",
        ],
        "super": "MOVE_YURI_HIEN_HOU_OU_KYA_KU_S",
        "easy": "mMvIn_ChkEasyDir MoveInit_Yuri_KoOuKen, MoveInit_Yuri_KuuGa, MoveInit_Yuri_RaiOhKen, MoveInit_Yuri_SaiHa, MoveInit_Yuri_HyakuRetsuBinta, MoveInit_Yuri_HienHouOuKyaku, MoveInit_Yuri_HienHouOuKyaku",
    },
    "joe": {
        "class": "Joe",
        "icon": 5,
        "code_bank": "bank05.asm",
        "code_start": "MoveC_Joe_ThrowG:",
        "code_end": "; =============== END OF BANK",
        "specials": [
            "MOVE_JOE_HURRICANE_UPPER_L", "MOVE_JOE_HURRICANE_UPPER_H",
            "MOVE_JOE_SLASH_KICK_L", "MOVE_JOE_SLASH_KICK_H",
            "MOVE_JOE_BAKURETSUKEN_L", "MOVE_JOE_BAKURETSUKEN_H",
            "MOVE_JOE_TIGER_KICK_L", "MOVE_JOE_TIGER_KICK_H",
            "MOVE_JOE_OUGON_NO_KAKATO_L", "MOVE_JOE_OUGON_NO_KAKATO_H",
        ],
        "super": "MOVE_JOE_SCREW_UPPER_S",
        "easy": "mMvIn_ChkEasyDir MoveInit_Joe_TigerKick, MoveInit_Joe_SlashKick, MoveInit_Joe_Bakuretsuken, MoveInit_Joe_HurricaneUpper, MoveInit_Joe_OugonNoKakato, MoveInit_Joe_ScrewUpper, MoveInputReader_Joe_NoMove",
    },
    "heidern": {
        "class": "Heidern",
        "icon": 6,
        "code_bank": "bank18.asm",
        "code_start": "MoveC_Heidern_ThrowG:",
        "code_end": "; =============== START OF MODULE Win/Cutscene",
        "specials": [
            "MOVE_HEIDERN_CROSS_CUTTER_L", "MOVE_HEIDERN_CROSS_CUTTER_H",
            "MOVE_HEIDERN_NECK_ROLLER_L", "MOVE_HEIDERN_NECK_ROLLER_H",
            "MOVE_HEIDERN_STORM_BRINGER_L", "MOVE_HEIDERN_STORM_BRINGER_H",
            "MOVE_HEIDERN_MOON_SLASHER_L", "MOVE_HEIDERN_MOON_SLASHER_H",
        ],
        "super": "MOVE_HEIDERN_FINAL_BRINGER_S",
        "easy": "mMvIn_ChkEasyDir MoveInit_Heidern_CrossCutter, MoveInit_Heidern_NeckRoller, MoveInit_Heidern_MoonSlasher, MoveInit_Heidern_StormBringer, MoveInit_Heidern_StormBringer, MoveInputReader_Heidern_NoMove, MoveInit_Heidern_FinalBringer",
    },
    "ralf": {
        "class": "Ralf",
        "icon": 7,
        "code_bank": "bank19.asm",
        "code_start": "MoveC_Ralf_ThrowG:",
        "code_end": "\nIF VER_EN\n",
        "gfx_banks": 2,
        "specials": [
            "MOVE_RALF_VULCAN_PUNCH_L", "MOVE_RALF_VULCAN_PUNCH_H",
            "MOVE_RALF_GATLING_ATTACK_L", "MOVE_RALF_GATLING_ATTACK_H",
            "MOVE_RALF_BACK_BREAKER_L", "MOVE_RALF_BACK_BREAKER_H",
            "MOVE_RALF_BAKUDAN_PUNCH_L", "MOVE_RALF_BAKUDAN_PUNCH_H",
        ],
        "super": "MOVE_RALF_BARIBARI_VULCAN_PUNCH_S",
        "easy": "mMvIn_ChkEasyDir MoveInit_Ralf_GatlingAttack, MoveInit_Ralf_BakudanPunch, MoveInit_Ralf_VulcanPunch, MoveInit_Ralf_BackBreaker, MoveInit_Ralf_GatlingAttack, MoveInit_Ralf_BaribariVulcanPunch, MoveInit_Ralf_BaribariVulcanPunch",
    },
}

COMMON = [
    "MOVE_SHARED_IDLE", "MOVE_SHARED_WALK_F", "MOVE_SHARED_WALK_B",
    "MOVE_SHARED_CROUCH", "MOVE_SHARED_JUMP_N", "MOVE_SHARED_JUMP_F",
    "MOVE_SHARED_JUMP_B", "MOVE_SHARED_BLOCK_G", "MOVE_SHARED_BLOCK_C",
    "MOVE_SHARED_BLOCK_G", "MOVE_SHARED_HOP_F", "MOVE_SHARED_HOP_B",
    "MOVE_SHARED_CHARGEMETER", "MOVE_SHARED_TAUNT", "MOVE_SHARED_DODGE",
    "MOVE_SHARED_DODGE", "MOVE_SHARED_WAKEUP", "MOVE_SHARED_DIZZY",
    "MOVE_SHARED_WIN", "MOVE_SHARED_WIN", "MOVE_SHARED_LOST_TIMEOVER",
    "MOVE_SHARED_INTRO", "MOVE_SHARED_INTRO", "MOVE_SHARED_PUNCH_LN",
    "MOVE_SHARED_PUNCH_HN", "MOVE_SHARED_KICK_LN", "MOVE_SHARED_KICK_HN",
    "MOVE_SHARED_PUNCH_CL", "MOVE_SHARED_PUNCH_CH", "MOVE_SHARED_KICK_CL",
    "MOVE_SHARED_KICK_CH", "MOVE_SHARED_STRIKE", "MOVE_SHARED_PUNCH_ALI",
    "MOVE_SHARED_KICK_ALI", "MOVE_SHARED_ATTACK_A",
]

TAIL = [
    "MOVE_SHARED_THROW_G", "MOVE_SHARED_THROW_A", "MOVE_SHARED_POST_BLOCKSTUN",
    "MOVE_SHARED_POST_BLOCKSTUN", "MOVE_SHARED_LAUNCH_UB", "MOVE_SHARED_HIT0MID",
    "MOVE_SHARED_HIT1MID", "MOVE_SHARED_HITLOW", "MOVE_SHARED_LAUNCH_UB",
    "MOVE_SHARED_LAUNCH_DB_SHAKE", "MOVE_SHARED_GROUND_SHAKE",
    "MOVE_SHARED_LAUNCH_SWOOPUP", "MOVE_SHARED_HIT_SWEEP",
    "MOVE_SHARED_LAUNCH_UB_REC", "MOVE_SHARED_HIT_MULTIMID0",
    "MOVE_SHARED_HIT_MULTIMID1", "MOVE_SHARED_LAUNCH_DB_SHAKE",
    "MOVE_SHARED_LAUNCH_UB_SHAKE", "MOVE_SHARED_GRAB_UB_NOSYNC",
    "MOVE_SHARED_GRAB_FG_NOSYNC", "MOVE_SHARED_GRAB_UB_SYNC",
    "MOVE_SHARED_GRAB_FG_NOSYNC", "MOVE_SHARED_GRAB_UB_SYNC",
]

ORDER_SELECT_FIGHTERS = [
    ("kim", "Kim"),
    ("benimaru", "Benimaru"),
    ("yuri", "Yuri"),
    ("joe", "Joe"),
    ("heidern", "Heidern"),
    ("ralf", "Ralf"),
]

PROJECTILE_FIGHTERS = {
    "benimaru": "benimaru.bin",
    "yuri": "yuri.bin",
    "joe": "joe.bin",
    "heidern": "heidern.bin",
}

PROJECTILE_OBJ_TABLES = [
    "OBJLstPtrTable_Proj_Benimaru_ThunderBall",
    "OBJLstPtrTable_Proj_Ryo_KoOuKenG",
    "OBJLstPtrTable_Proj_Ryo_HaohShoukouKen",
    "OBJLstPtrTable_Proj_Ryo_KoOuKenA",
    "OBJLstPtrTable_Proj_Yuri_RaiOhKen",
    "OBJLstPtrTable_Proj_Joe_HurricaneUpper",
    "OBJLstPtrTable_Proj_Joe_ScrewUpper",
    "OBJLstPtrTable_Proj_Heidern_CrossCutter",
]

OBJ_FLAG_VALUES = {
    "OLF_USETILEFLAGS": 0x10,
    "OLF_XFLIP": 0x20,
    "OLF_YFLIP": 0x40,
}


def table_rows(text: str, label: str, macro: str) -> dict[str, str]:
    start = text.index(label + ":")
    end = text.find("\nMove", start + len(label) + 1)
    rows: dict[str, str] = {}
    for line in text[start:end].splitlines():
        if macro not in line:
            continue
        match = re.search(r"; (MOVE_[A-Z0-9_]+)$", line.strip())
        if match:
            rows[match.group(1)] = line.split(";", 1)[0].rstrip()
    return rows


def fallback_anim(cls: str) -> str:
    return f"\tmMvAnDef OBJLstPtrTable_{cls}_Idle, $00,$01,$00,$00,$00"


def fallback_code() -> str:
    return "\tmMvCodeDef MoveC_Base_NormH"


def emit_table(cls: str, cfg: dict[str, object]) -> str:
    anim_text = (VENDOR / "src/bank05.asm").read_text()
    code_text = (VENDOR / "src/bank06.asm").read_text()
    anim = table_rows(anim_text, f"MoveAnimTbl_{cls}", "mMvAnDef")
    code = table_rows(code_text, f"MoveCodePtrTbl_{cls}", "mMvCodeDef")
    specials = list(cfg["specials"])
    special_slots = specials + [None] * (14 - len(specials))
    super_slots: list[str | None] = [str(cfg["super"]), str(cfg["super"]), None, None]
    keys: list[str | None] = COMMON + special_slots + super_slots + TAIL
    if len(keys) != 76:
        raise AssertionError((cls, len(keys)))

    out = [
        f"; Generated from Kak2X/kof95 commit {EXPECTED_VENDOR_COMMIT}",
        f"MoveAnimTbl_{cls}96:",
        "\tdb $4C,$00,$00,$00,$00,$00,$00,$00",
    ]
    for key in keys:
        if key == "MOVE_SHARED_GROUND_SHAKE":
            # KOF96 split grounded HITTYPE_LAUNCH_FAST_DB into a dedicated
            # three-frame state. KOF95 has no matching table row: reusing its
            # LaunchDBShake row leaves frame 0 at ANIMSPEED_NONE ($FF), while
            # MoveC_Hit_Ground_Shake waits for that frame to end. Use the
            # three-frame sweep mapping and KOF96's immediate startup timing,
            # exactly like the native KOF96 character tables.
            out.append(
                f"\tmMvAnDef OBJLstPtrTable_{cls}_HitSweep, "
                "$00, $00, $00, $00, $00"
            )
        else:
            out.append("\t" + anim[key].lstrip() if key and key in anim else fallback_anim(cls))
    out += ["", f"MoveCodePtrTbl_{cls}96:"]
    # KOF96 handles $00-$2E and $70+ through shared resident code. Its
    # character-specific code table therefore starts at MOVE_SHARED_PUNCH_L
    # ($30), unlike KOF95's full table. Emitting the animation prefix here made
    # every normal attack execute the wrong routine (Yuri's punch ran Idle).
    code_keys = COMMON[23:] + special_slots + super_slots + TAIL[:2]
    if len(code_keys) != 32:
        raise AssertionError((cls, len(code_keys)))
    for key in code_keys:
        out.append("\t" + code[key].lstrip() if key and key in code else fallback_code())
    return "\n".join(out) + "\n"


def parse_asm_value(value: str) -> int:
    """Parse the small constant expressions used by imported OBJ headers."""
    result = 0
    for part in value.strip().split("|"):
        part = part.strip()
        if part.startswith("$"):
            result |= int(part[1:], 16)
        elif part.isdecimal():
            result |= int(part)
        elif part in OBJ_FLAG_VALUES:
            result |= OBJ_FLAG_VALUES[part]
        else:
            raise ValueError(f"unsupported OBJ value: {value}")
    return result


def signed_byte(value: int) -> int:
    return value - 0x100 if value & 0x80 else value


def decode_tile(gfx: bytes, tile_id: int) -> list[list[int]]:
    start = tile_id * 0x10
    raw = gfx[start : start + 0x10]
    if len(raw) != 0x10:
        raise ValueError(f"tile ${tile_id:02X} exceeds {len(gfx)}-byte GFX block")
    pixels: list[list[int]] = []
    for row in range(8):
        lo, hi = raw[row * 2 : row * 2 + 2]
        pixels.append([
            ((lo >> (7 - column)) & 1) | (((hi >> (7 - column)) & 1) << 1)
            for column in range(8)
        ])
    return pixels


def load_gfx_declarations(slug: str) -> dict[str, bytes]:
    declarations: dict[str, bytes] = {}
    for asm_path in sorted((ROOT / "src/mixkof").glob(f"{slug}95_gfx*.asm")):
        for label, relative_path in re.findall(
            r'^(GFX_Char_[A-Za-z0-9_]+): INCBIN "([^"]+)"$',
            asm_path.read_text(),
            re.MULTILINE,
        ):
            declarations[label] = (ROOT / relative_path).read_bytes()
    return declarations


def render_idle_frame(slug: str, cls: str) -> bytes:
    """Flatten the first standing frame into KOF96's 3x6 order-select shape."""
    obj_text = (ROOT / f"src/mixkof/{slug}95_objlst.asm").read_text()
    first_frame = re.search(
        rf"^OBJLstPtrTable_{cls}_Idle:\s*\n\s*dw ([^\n]+)",
        obj_text,
        re.MULTILINE,
    )
    if not first_frame:
        raise ValueError(f"missing first idle frame for {cls}")
    headers = re.findall(r"OBJLstHdr[AB]_[A-Za-z0-9_]+", first_frame.group(1))
    gfx_by_label = load_gfx_declarations(slug)
    canvas: dict[tuple[int, int], int] = {}

    for header in headers:
        section_match = re.search(
            rf"^{re.escape(header)}:\n(.*?)(?=^[A-Za-z_][A-Za-z0-9_]*:|\Z)",
            obj_text,
            re.MULTILINE | re.DOTALL,
        )
        if not section_match:
            raise ValueError(f"missing OBJ header {header}")
        section = section_match.group(1)
        flags_match = re.search(r"db ([^;]+) ; iOBJLstHdrA_Flags", section)
        gfx_match = re.search(r"dpr (GFX_Char_[A-Za-z0-9_]+)", section)
        x_match = re.search(r"db ([^;]+) ; iOBJLstHdrA_XOffset", section)
        y_match = re.search(r"db ([^;]+) ; iOBJLstHdrA_YOffset", section)
        data_match = re.search(r"^\.bin:\n(.*)", section, re.MULTILINE | re.DOTALL)
        if not all((flags_match, gfx_match, x_match, y_match, data_match)):
            raise ValueError(f"incomplete OBJ header {header}")

        flags = parse_asm_value(flags_match.group(1))
        gfx_label = gfx_match.group(1)
        gfx = gfx_by_label[gfx_label]
        x_offset = signed_byte(parse_asm_value(x_match.group(1)))
        y_offset = signed_byte(parse_asm_value(y_match.group(1)))
        objects = re.findall(
            r"^\s*db \$([0-9A-Fa-f]{2}),\$([0-9A-Fa-f]{2}),\$([0-9A-Fa-f]{2})",
            data_match.group(1),
            re.MULTILINE,
        )

        for raw_y, raw_x, raw_tile in objects:
            y = signed_byte(int(raw_y, 16)) + y_offset
            x = signed_byte(int(raw_x, 16)) + x_offset
            tile_and_flags = int(raw_tile, 16)
            tile_xflip = bool(flags & 0x20)
            tile_yflip = bool(flags & 0x40)
            if flags & 0x10:
                tile_xflip ^= bool(tile_and_flags & 0x40)
                tile_yflip ^= bool(tile_and_flags & 0x80)
                tile_and_flags &= 0x3F
            if flags & 0x20:
                x = -x - 8
            if flags & 0x40:
                y = -y - 16

            sprite = decode_tile(gfx, tile_and_flags) + decode_tile(gfx, tile_and_flags + 1)
            for pixel_y in range(16):
                source_y = 15 - pixel_y if tile_yflip else pixel_y
                for pixel_x in range(8):
                    source_x = 7 - pixel_x if tile_xflip else pixel_x
                    colour = sprite[source_y][source_x]
                    if colour:
                        # KOF95's P1 battle OBJ palette is $8C, while KOF96's
                        # order-select BG palette is $2D. Convert indices by
                        # matching their displayed DMG shades rather than by
                        # inverting raw 2bpp values:
                        #   OBJ $8C: 1=black, 2=white, 3=dark gray
                        #   BG  $2D: 1=black, 3=white, 2=dark gray
                        # Index 0 remains transparent while composing layers.
                        order_colour = (0, 1, 3, 2)[colour]
                        canvas[(x + pixel_x, y + pixel_y)] = order_colour

    if not canvas:
        raise ValueError(f"empty idle frame for {cls}")
    min_x = min(x for x, _ in canvas)
    max_x = max(x for x, _ in canvas)
    min_y = min(y for _, y in canvas)
    max_y = max(y for _, y in canvas)
    width = max_x - min_x + 1
    height = max_y - min_y + 1
    x_shift = (24 - width) // 2 - min_x
    y_shift = 48 - height - min_y

    fitted = [[0] * 24 for _ in range(48)]
    for (x, y), colour in canvas.items():
        output_x = x + x_shift
        output_y = y + y_shift
        if 0 <= output_x < 24 and 0 <= output_y < 48:
            fitted[output_y][output_x] = colour

    encoded = bytearray()
    for tile_y in range(6):
        for tile_x in range(3):
            for row in range(8):
                lo = 0
                hi = 0
                for column in range(8):
                    colour = fitted[tile_y * 8 + row][tile_x * 8 + column]
                    bit = 7 - column
                    lo |= (colour & 1) << bit
                    hi |= ((colour >> 1) & 1) << bit
                encoded.extend((lo, hi))
    if len(encoded) != 0x120:
        raise AssertionError((cls, len(encoded)))
    return bytes(encoded)


def build_order_select_idle_sheet() -> None:
    sheet = b"".join(render_idle_frame(slug, cls) for slug, cls in ORDER_SELECT_FIGHTERS)
    if len(sheet) != len(ORDER_SELECT_FIGHTERS) * 0x120:
        raise AssertionError(len(sheet))
    (ROOT / "data/gfx/ordsel_char_kof95.bin").write_bytes(sheet)
    print(f"Built KOF95 order-select idle sheet: {len(sheet)} bytes")


def build_projectile_assets() -> None:
    """Copy KOF95 projectile tiles and emit the required OBJ mapping closure."""
    output = ROOT / "data/gfx/proj/kof95"
    output.mkdir(parents=True, exist_ok=True)
    for filename in PROJECTILE_FIGHTERS.values():
        shutil.copyfile(VENDOR / "data/gfx/proj" / filename, output / filename)

    source = (VENDOR / "data/objlst/proj.asm").read_text()
    matches = list(re.finditer(r"(?m)^([A-Za-z_][A-Za-z0-9_]*):", source))
    blocks: dict[str, str] = {}
    order: list[str] = []
    for index, match in enumerate(matches):
        label = match.group(1)
        end = matches[index + 1].start() if index + 1 < len(matches) else len(source)
        blocks[label] = source[match.start() : end]
        order.append(label)

    required = set(PROJECTILE_OBJ_TABLES)
    pending = list(PROJECTILE_OBJ_TABLES)
    while pending:
        label = pending.pop()
        if label not in blocks:
            raise ValueError(f"missing projectile OBJ block {label}")
        for dependency in re.findall(r"\bOBJLst(?:PtrTable|Hdr[AB])_[A-Za-z0-9_]+", blocks[label]):
            if dependency in blocks and dependency not in required:
                required.add(dependency)
                pending.append(dependency)

    obj = "\n".join(blocks[label].rstrip() for label in order if label in required) + "\n"
    obj = re.sub(
        r"(?m)^(\s*)db (.+?) ; iOBJLstHdrA_YOffset$",
        r"\1db $00 ; iOBJLstHdrA_XOffset\n\1db \2 ; iOBJLstHdrA_YOffset",
        obj,
    )
    (ROOT / "src/mixkof/kof95_projectiles.asm").write_text(
        f"; Generated from Kak2X/kof95 commit {EXPECTED_VENDOR_COMMIT}\n" + obj
    )
    print(f"Imported KOF95 projectile mappings: {len(required)} blocks")


def adapt_code(cls: str, cfg: dict[str, object]) -> str:
    source = (VENDOR / "src" / str(cfg["code_bank"])).read_text()
    start = source.index(str(cfg["code_start"]))
    end = source.index(str(cfg["code_end"]), start)
    code = source[start:end]
    if cls == "Yuri":
        # Yuri shares Ryo's ground Ko Ou Ken and Haoh Shoukou Ken projectile
        # initializers in KOF95. They live before Yuri's source block, so bring
        # those two routines along with her own Rai Oh Ken implementation.
        shared_source = (VENDOR / "src/bank02.asm").read_text()
        for extra_start, extra_end in (
            ("ProjInit_Ryo_KoOuKenG:", "; =============== ProjInit_Ryo_KoOuKenA"),
            ("ProjInit_Ryo_HaohShoukouKen:", "; =============== ProjC_Ryo_KoOuKenA"),
        ):
            block_start = shared_source.index(extra_start)
            block_end = shared_source.index(extra_end, block_start)
            code += "\n" + shared_source[block_start:block_end]
    code = re.sub(
        rf"mMvIn_Validate {cls}, [0-9]+",
        f"mMvIn_Validate {cls}\n.chkAir:\n\tjp   MoveInputReader_{cls}_NoMove",
        code,
    )
    code = re.sub(rf"mMvIn_ChkEasy [^\n]+", str(cfg["easy"]), code, count=1)
    code = re.sub(rf"mMvIn_ChkGA {cls}, ([^,]+), ([^,]+), [^\n]+", rf"mMvIn_ChkGA {cls}, \1, \2", code)
    code = code.replace("IF VER_EN", "IF REV_LANG_EN")
    code = code.replace("HITTYPE_GRAB_UB_NOSYNC", "HITTYPE_GRAB_START")
    code = code.replace("HITTYPE_GRAB_FG_NOSYNC", "HITTYPE_GRAB_ROTL")
    code = code.replace("HITTYPE_GRAB_UB_SYNC", "HITTYPE_GRAB_ROTU")
    code = code.replace("SFX_SPECIAL", "SFX_MOVEJUMP_A")
    code = code.replace("MOVE_RYO_KO_OU_KEN_GH", "MOVE_YURI_KO_OU_KEN_H")
    code = code.replace("MoveInput_FBFDB", "MoveInput_FDBFDB")
    code = code.replace("PCF_PUSHED|PCF_PUSHEDOTHER", "(1<<PCFB_PUSHED)|(1<<PCFB_PUSHEDOTHER)")
    code = code.replace("MOVE_SHARED_DODGE", "MOVE_SHARED_ROLL_F")
    code = code.replace("iOBJInfo_Proj_ThunderBall_Despawn", "iOBJInfo_Custom+$08")
    code = code.replace("PROJ_TB_VISIBLE", "$00")
    code = code.replace("PROJ_TB_DESPAWN", "$FF")
    code = re.sub(
        r"(?m)^\s*mMvIn_ValSkipWithChar CHAR_ID_RUGAL, \.rugalEnd\s*$",
        "\t\t; Joe-only import: the shared Rugal throw exit is unreachable.",
        code,
    )
    code = re.sub(
        r"mMvIn_ValStartCmdThrow_StdColi (\.[A-Za-z0-9_]+)",
        r"call MoveInputS_TryStartCommandThrow_StdColi\n\tjp   nc, \1\n\tcall Task_PassControlFar\n\tld   a, PLAY_THROWACT_NEXT03\n\tld   [wPlayPlThrowActId], a",
        code,
    )
    code = re.sub(
        r"(?s); =============== MoveC_Base_ThrowA_DirD ===============.*?(?=; =============== MoveC_Base_NormA ===============)",
        "",
        code,
    )
    code = re.sub(r"mMvC_ValHit (\.[A-Za-z0-9_]+)(\s*;[^\n]*)?$", r"mMvC_ValHit \1, \1\2", code, flags=re.MULTILINE)
    # KOF96 reserves $8A60 (tile $A6) for player 2 projectiles; KOF95 used
    # $8A40 (tile $A4). Keep every imported initializer consistent with the
    # KOF96 round loader and OBJInfo defaults.
    code = code.replace("$A4\t; Graphics from $8A40", "$A6\t; Graphics from $8A60")
    code = code.replace("$A4\t\t; Graphics from $8A40", "$A6\t\t; Graphics from $8A60")
    compat_inputs = ""
    if cls == "Heidern":
        code = code.replace("MoveInput_BDU_Charge", "MoveInput_Heidern_BDU_Charge95")
        # In KOF95 Heidern and HitTypeS_SyncPlPosFromOtherPos both live in
        # bank $02. The imported move code lives in its own expansion bank, so
        # retaining the near call jumps to the same address in the wrong bank
        # as soon as Neck Roller connects. Inline the small helper while BC
        # still points at the active player's wPlInfo.
        code = code.replace(
            "\t\tcall HitTypeS_SyncPlPosFromOtherPos",
            """\t\tpush bc
\t\t\tld   hl, iPlInfo_OBJInfoXOther
\t\t\tadd  hl, bc
\t\t\tpush hl
\t\t\tpop  bc
\t\t\tld   hl, iOBJInfo_X
\t\t\tadd  hl, de
\t\t\tld   a, [bc]
\t\t\tinc  bc
\t\t\tldi  [hl], a
\t\t\tinc  hl
\t\t\tld   a, [bc]
\t\t\tld   [hl], a
\t\tpop  bc""",
        )
        compat_inputs = """MoveInput_Heidern_BDU_Charge95:
\tdb $03
\tdb KEY_UP, KEY_UP, $01, $14
\tdb KEY_DOWN, KEY_DOWN, $01, $0A
\tdb KEY_RIGHT, KEY_RIGHT, $1E, $FF

"""
    elif cls == "Ralf":
        code = code.replace("MoveInput_1BF_Charge", "MoveInput_Ralf_1BF_Charge95")
        compat_inputs = """MoveInput_Ralf_1BF_Charge95:
\tdb $03
\tdb KEY_LEFT, KEY_LEFT, $01, $14
\tdb KEY_RIGHT, KEY_RIGHT, $01, $0A
\tdb KEY_RIGHT|KEY_DOWN, KEY_RIGHT|KEY_DOWN, $1E, $FF

"""
    return (
        f"; Generated from Kak2X/kof95 commit {EXPECTED_VENDOR_COMMIT}\n"
        + compat_inputs
        + code
    )


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Legacy one-shot KOF95 bootstrap importer (not a maintenance tool)."
    )
    parser.add_argument(
        "--force-legacy-bootstrap",
        action="store_true",
        help="overwrite all imported fighter sources from KOF95 (destructive)",
    )
    args = parser.parse_args()
    if not args.force_legacy_bootstrap:
        raise SystemExit(
            "batch import is disabled: imported fighters are maintained by "
            "per-character source review; pass --force-legacy-bootstrap only "
            "when intentionally recreating the initial bootstrap"
        )

    commit = subprocess.check_output(
        ["git", "rev-parse", "HEAD"], cwd=VENDOR, text=True
    ).strip()
    if commit != EXPECTED_VENDOR_COMMIT:
        raise SystemExit(f"unexpected kof95 commit: {commit}")

    generated = ROOT / "src/mixkof"
    generated.mkdir(parents=True, exist_ok=True)
    build_projectile_assets()
    icons = bytearray((ROOT / "data/gfx/char_icons_mix.bin").read_bytes()[: 21 * 0x40])
    icons95 = (VENDOR / "data/gfx/char_icons.bin").read_bytes()

    source_declarations = "\n".join(
        path.read_text() for path in sorted((VENDOR / "src").glob("bank*.asm"))
    )
    for slug, cfg in FIGHTERS.items():
        cls = str(cfg["class"])
        source_gfx = VENDOR / "data/gfx/char"
        output_gfx = ROOT / f"data/gfx/char/kof95_{slug}"
        output_gfx.mkdir(parents=True, exist_ok=True)
        files = sorted(source_gfx.glob(f"{slug}_*.bin"))
        for source in files:
            shutil.copyfile(source, output_gfx / source.name)

        declaration_header = (
            f"; Generated from Kak2X/kof95 commit {EXPECTED_VENDOR_COMMIT}"
        )
        declarations: list[tuple[str, str]] = []
        pattern = rf'^(GFX_Char_{cls}_[A-Za-z0-9_]+): INCBIN "data/gfx/char/({slug}_[^"]+\.bin)"$'
        for label, filename in re.findall(pattern, source_declarations, re.MULTILINE):
            declarations.append((label, filename))

        gfx_banks = int(cfg.get("gfx_banks", 1))
        chunks: list[list[tuple[str, str]]] = [[] for _ in range(gfx_banks)]
        chunk_sizes = [0] * gfx_banks
        chunk = 0
        for declaration in declarations:
            size = (output_gfx / declaration[1]).stat().st_size
            if chunk_sizes[chunk] + size > 0x4000 and chunk + 1 < gfx_banks:
                chunk += 1
            chunks[chunk].append(declaration)
            chunk_sizes[chunk] += size
        if any(size > 0x4000 for size in chunk_sizes):
            raise SystemExit(f"{cls} graphics do not fit in {gfx_banks} banks: {chunk_sizes}")
        for index, declarations_chunk in enumerate(chunks):
            suffix = "" if gfx_banks == 1 else f"_{index}"
            lines = [declaration_header]
            lines.extend(
                f'{label}: INCBIN "data/gfx/char/kof95_{slug}/{filename}"'
                for label, filename in declarations_chunk
            )
            (generated / f"{slug}95_gfx{suffix}.asm").write_text("\n".join(lines) + "\n")

        obj = (VENDOR / f"data/objlst/char/{slug}.asm").read_text()
        obj = re.sub(
            r"(?m)^(\s*)db (.+?) ; iOBJLstHdrA_YOffset$",
            r"\1db $00 ; iOBJLstHdrA_XOffset\n\1db \2 ; iOBJLstHdrA_YOffset",
            obj,
        )
        (generated / f"{slug}95_objlst.asm").write_text(
            f"; Generated from Kak2X/kof95 commit {EXPECTED_VENDOR_COMMIT}\n" + obj
        )
        tables = emit_table(cls, cfg)
        tables = tables.replace("MoveC_Base_Hop", "MoveC_Base_HopB")
        tables = tables.replace("MoveC_Base_Dodge", "MoveC_Base_Roll")
        tables = tables.replace("MoveC_Hit_GrabNoSync", "MoveC_Hit_Grab_Rot")
        tables = tables.replace("MoveC_Hit_GrabSync", "MoveC_Hit_Grab_Rot")
        tables = tables.replace("MoveC_Terry_PunchHN", "MoveC_Base_NormH")
        (generated / f"{slug}96_tables.asm").write_text(tables)
        (generated / f"{slug}95_code.asm").write_text(adapt_code(cls, cfg))

        index = int(cfg["icon"])
        raw = icons95[index * 0x40 : (index + 1) * 0x40]
        icons.extend(
            b"".join(raw[tile * 0x10 : (tile + 1) * 0x10] for tile in (0, 2, 1, 3))
        )
        print(f"Imported {cls}: {len(files)} frames, gfx banks {chunk_sizes}")

    (ROOT / "data/gfx/char_icons_mix.bin").write_bytes(icons)
    build_order_select_idle_sheet()


if __name__ == "__main__":
    main()
