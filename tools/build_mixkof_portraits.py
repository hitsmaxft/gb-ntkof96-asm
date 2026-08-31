#!/usr/bin/env python3
"""Build derived mixed-roster character-select portrait assets.

The original games store every portrait as nine consecutive Game Boy 2bpp
tiles (24x24 pixels). The mixed 6x5 grid keeps the full 24-pixel height and
crops four pixels from each horizontal edge, producing six tiles (16x24).
The source graphics are read-only inputs; every generated layout is written to
a separate ``charsel_mix_*.bin`` file.
"""

from __future__ import annotations

import argparse
import subprocess
from pathlib import Path


EXPECTED_KOF95_COMMIT = "d1a2372dbfc474ddcbb94a69ffdb4546a8d5ed08"
TILE_BYTES = 16
PORTRAIT_24_TILES = 9
PORTRAIT_16X24_TILES = 6
ICON_BYTES = 4 * TILE_BYTES

# Visible KOF96 slots followed by the twelve characters unique to KOF95.
KOF95_UNIQUE_INDICES = (1, 3, 5, 6, 7, 9, 10, 13, 14, 15, 16, 17)

# Kyo, Ryo, Terry, Athena, Mai and Iori. These are loaded dynamically into
# their KOF96 portrait slots when START changes the character version.
KOF95_SHARED_INDICES = (0, 2, 4, 8, 11, 12)

# Mr. Karate occupies two adjacent 24x24 source blocks in KOF96. The mixed
# selector derives a centered face crop from the complete 48x24 artwork without
# modifying either source block. The last row groups the three KOF96 bosses
# with the reserved Saisyu and Rugal portraits; slot 29 remains empty.
SINGLEPAGE_LAYOUT = (
    *(('kof96', index) for index in range(13)),
    ('kof96', 17),       # Leona
    ('kof95', 1),        # Benimaru
    ('kof95', 3),        # Yuri
    ('kof95', 5),        # Joe
    ('kof95', 6),        # Heidern
    ('kof95', 7),        # Ralf
    ('kof95', 9),        # Kensou
    ('kof95', 10),       # Kim
    ('kof95', 13),       # Eiji
    ('kof95', 14),       # Billy
    ('kof95', 17),       # Nakoruru (reserved)
    ('kof96', 13),       # Chizuru
    ('kof96', 16),       # Goenitz
    ('mrkarate', 0),     # Mr. Karate, centered crop from both source blocks
    ('kof95', 15),       # Saisyu (reserved)
    ('kof95', 16),       # Rugal (reserved)
)


def decompress_lzss(source: bytes, output_size: int) -> bytes:
    """Decode the game's LZSS stream, stopping at the exact required size."""
    command_count = (((source[1] & 0x3F) << 8) | source[0]) + 1
    split = 4 - ((source[1] >> 6) & 0x03)
    length_mask = (1 << split) - 1
    source_pos = 2
    output = bytearray()

    for _ in range(command_count):
        command_mask = source[source_pos]
        source_pos += 1
        for bit in range(7, -1, -1):
            if len(output) >= output_size:
                return bytes(output)
            if command_mask & (1 << bit):
                token = source[source_pos]
                source_pos += 1
                offset = -((token >> split) + 1)
                length = (token & length_mask) + 1
                for _ in range(length):
                    if len(output) >= output_size:
                        return bytes(output)
                    output.append(output[offset])
            else:
                output.append(source[source_pos])
                source_pos += 1

    if len(output) < output_size:
        raise ValueError(f"LZSS output is {len(output)} bytes, expected {output_size}")
    return bytes(output[:output_size])


def decode_tile(source: bytes, tile_index: int) -> list[list[int]]:
    offset = tile_index * TILE_BYTES
    result = [[0] * 8 for _ in range(8)]
    for y in range(8):
        low = source[offset + y * 2]
        high = source[offset + y * 2 + 1]
        for x in range(8):
            bit = 7 - x
            result[y][x] = ((high >> bit) & 1) * 2 + ((low >> bit) & 1)
    return result


def decode_portrait(source: bytes, portrait_index: int) -> list[list[int]]:
    result = [[0] * 24 for _ in range(24)]
    first_tile = portrait_index * PORTRAIT_24_TILES
    for local_tile in range(PORTRAIT_24_TILES):
        tile = decode_tile(source, first_tile + local_tile)
        tile_x = (local_tile % 3) * 8
        tile_y = (local_tile // 3) * 8
        for y in range(8):
            result[tile_y + y][tile_x : tile_x + 8] = tile[y]
    return result


def encode_tile(pixels: list[list[int]]) -> bytes:
    result = bytearray()
    for row in pixels:
        low = 0
        high = 0
        for x, value in enumerate(row):
            bit = 7 - x
            low |= (value & 1) << bit
            high |= ((value >> 1) & 1) << bit
        result.extend((low, high))
    return bytes(result)


def compact_portrait(source: bytes, portrait_index: int) -> bytes:
    portrait = decode_portrait(source, portrait_index)
    cropped = [row[4:20] for row in portrait]
    return encode_compact_portrait(cropped)


def encode_compact_portrait(cropped: list[list[int]]) -> bytes:
    """Encode an already cropped 16x24 portrait as six 2bpp tiles."""
    result = bytearray()
    for tile_y in range(3):
        for tile_x in range(2):
            tile = [row[tile_x * 8 : tile_x * 8 + 8] for row in cropped[tile_y * 8 : tile_y * 8 + 8]]
            result.extend(encode_tile(tile))
    assert len(result) == PORTRAIT_16X24_TILES * TILE_BYTES
    return bytes(result)


def compact_mrkarate(source: bytes) -> bytes:
    """Keep Mr. Karate's full face when reducing his wide portrait to 16px."""
    left = decode_portrait(source, 14)
    right = decode_portrait(source, 15)
    wide = [left_row + right_row for left_row, right_row in zip(left, right)]
    return encode_compact_portrait([row[18:34] for row in wide])


def variant_marker_tiles() -> bytes:
    """Create hollow/filled 4x4 version markers centered in an 8x8 tile."""
    result = bytearray()
    for filled in (False, True):
        pixels = [[0] * 8 for _ in range(8)]
        for y in range(2, 6):
            for x in range(2, 6):
                if filled or x in (2, 5) or y in (2, 5):
                    pixels[y][x] = 3
        result.extend(encode_tile(pixels))
    return bytes(result)


def reorder_kof95_icon(source: bytes, icon_index: int) -> bytes:
    """Convert KOF95's TL,TR,BL,BR storage to KOF96's TL,BL,TR,BR."""
    raw = source[icon_index * ICON_BYTES : (icon_index + 1) * ICON_BYTES]
    return b"".join(
        raw[tile * TILE_BYTES : (tile + 1) * TILE_BYTES]
        for tile in (0, 2, 1, 3)
    )


def git_head(repository: Path) -> str:
    return subprocess.check_output(
        ("git", "-C", str(repository), "rev-parse", "HEAD"), text=True
    ).strip()


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--kof95-dir", type=Path, default=Path("../kof95"))
    parser.add_argument("--allow-different-revision", action="store_true")
    args = parser.parse_args()

    project = Path(__file__).resolve().parents[1]
    kof95 = args.kof95_dir.resolve()
    revision = git_head(kof95)
    if revision != EXPECTED_KOF95_COMMIT and not args.allow_different_revision:
        raise SystemExit(
            f"kof95 is at {revision}; expected {EXPECTED_KOF95_COMMIT}. "
            "Pass --allow-different-revision only for an intentional vendor update."
        )

    kof96_bg0 = (project / "data/gfx/charsel_bg0.bin").read_bytes()
    kof96_bg1 = decompress_lzss(
        (project / "data/gfx/charsel_bg1.lzc").read_bytes(), 120 * TILE_BYTES
    )
    kof96_portraits = kof96_bg0 + kof96_bg1[: 81 * TILE_BYTES]

    kof95_bg0 = (kof95 / "data/gfx/charsel_bg0.bin").read_bytes()
    kof95_bg1 = (kof95 / "data/gfx/charsel_bg1.bin").read_bytes()
    kof95_portraits = kof95_bg0 + kof95_bg1[: 81 * TILE_BYTES]

    base = bytearray()
    for index in range(18):
        base.extend(compact_portrait(kof96_portraits, index))
    for index in KOF95_UNIQUE_INDICES:
        base.extend(compact_portrait(kof95_portraits, index))

    variants = bytearray()
    for index in KOF95_SHARED_INDICES:
        variants.extend(compact_portrait(kof95_portraits, index))
    # The final 39 tiles of the decompressed KOF96 BG1 block contain the three
    # existing START variants followed by unrelated selection-screen graphics.
    special_portraits = kof96_bg1[81 * TILE_BYTES : 108 * TILE_BYTES]
    for index in range(3):
        variants.extend(compact_portrait(special_portraits, index))

    singlepage = bytearray()
    portrait_sources = {'kof96': kof96_portraits, 'kof95': kof95_portraits}
    for source_name, index in SINGLEPAGE_LAYOUT:
        if source_name == 'mrkarate':
            singlepage.extend(compact_mrkarate(kof96_portraits))
        else:
            singlepage.extend(compact_portrait(portrait_sources[source_name], index))
    assert len(singlepage) == 29 * PORTRAIT_16X24_TILES * TILE_BYTES

    compact_cross = compact_portrait(
        (project / "data/gfx/charsel_cross.bin").read_bytes(), 0
    )
    compact_cross_mask = compact_portrait(
        (project / "data/gfx/charsel_cross_mask.bin").read_bytes(), 0
    )

    output_dir = project / "data/gfx"
    base_path = output_dir / "charsel_mix_base.bin"
    variants_path = output_dir / "charsel_mix_variants.bin"
    singlepage_path = output_dir / "charsel_mix_singlepage.bin"
    markers_path = output_dir / "charsel_mix_markers.bin"
    icons_path = output_dir / "char_icons_mix.bin"
    cross_path = output_dir / "charsel_mix_cross.bin"
    cross_mask_path = output_dir / "charsel_mix_cross_mask.bin"
    base_path.write_bytes(base)
    variants_path.write_bytes(variants)
    singlepage_path.write_bytes(singlepage)
    markers_path.write_bytes(variant_marker_tiles())
    # Entries 0-31 already contain the twenty KOF96 icons and twelve
    # individually corrected KOF95-only icons. Append the six shared-name
    # KOF95 versions at logical IDs 32-37 so selected-team and battle HUD
    # lookups cannot run beyond the icon table into black data.
    icons95 = (kof95 / "data/gfx/char_icons.bin").read_bytes()
    icons = bytearray(icons_path.read_bytes()[: 32 * ICON_BYTES])
    for index in KOF95_SHARED_INDICES:
        icons.extend(reorder_kof95_icon(icons95, index))
    icons_path.write_bytes(icons)
    cross_path.write_bytes(compact_cross)
    cross_mask_path.write_bytes(compact_cross_mask)
    print(f"vendor={revision}")
    print(f"{base_path.relative_to(project)}: {len(base)} bytes, 30 portraits")
    print(f"{variants_path.relative_to(project)}: {len(variants)} bytes, 9 portraits")
    print(f"{singlepage_path.relative_to(project)}: {len(singlepage)} bytes, 29 portraits")
    print(f"{markers_path.relative_to(project)}: 32 bytes, hollow/filled version markers")
    print(f"{icons_path.relative_to(project)}: {len(icons)} bytes, 38 icons")
    print(f"{cross_path.relative_to(project)}: {len(compact_cross)} bytes, 16x24 cross")
    print(f"{cross_mask_path.relative_to(project)}: {len(compact_cross_mask)} bytes, 16x24 mask")


if __name__ == "__main__":
    main()
