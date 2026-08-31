#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
cd "$repo_dir"

build_dir="${BUILD_DIR:-build}"
case "$build_dir" in
  ""|.|..|/*|../*|*/../*|*/..)
    echo "BUILD_DIR must be a relative directory inside the repository" >&2
    exit 2
    ;;
esac
build_root="$repo_dir/$build_dir"

clean() {
  rm -rf "$build_root"

  # Remove outputs created by older versions of this script. Emulator RAM and
  # manually packaged release archives are deliberately left untouched.
  rm -f \
    "$repo_dir"/kof96.gb "$repo_dir"/kof96.gbc \
    "$repo_dir"/kof96.map "$repo_dir"/kof96.o "$repo_dir"/kof96.sym \
    "$repo_dir"/kof96e.gb "$repo_dir"/kof96e.gbc \
    "$repo_dir"/kof96e.map "$repo_dir"/kof96e.o "$repo_dir"/kof96e.sym

  echo "Cleaned $build_dir and legacy root build outputs"
}

variant="${1:-jp}"
if [[ "$variant" == "clean" ]]; then
  clean
  exit 0
fi

case "$variant" in
  jp)
    config="config-jp.asm"
    output="kof96"
    description="Japanese mixed-roster build"
    ;;
  en)
    config="config-en.asm"
    output="kof96e"
    description="English build"
    ;;
  *)
    echo "usage: $0 [jp|en|clean]" >&2
    exit 2
    ;;
esac

for tool in rgbasm rgblink rgbfix zip; do
  if ! command -v "$tool" >/dev/null 2>&1; then
    echo "$tool is required; enter the pinned environment with: nix-shell" >&2
    exit 1
  fi
done

rgbds_version="$(rgbasm --version)"
if [[ "$rgbds_version" != "rgbasm v0.7.0" ]]; then
  echo "RGBDS 0.7.0 is required; found: $rgbds_version" >&2
  echo "Enter the pinned environment with: nix-shell" >&2
  exit 1
fi

out_dir="$build_root/$variant"
object="$out_dir/$output.o"
rom="$out_dir/$output.gb"
map="$out_dir/$output.map"
symbols="$out_dir/$output.sym"
readme="$out_dir/README.txt"
checksums="$out_dir/SHA256SUMS"
archive_name="$output-$variant.zip"
archive="$out_dir/$archive_name"

mkdir -p "$out_dir"
rm -f "$object" "$rom" "$map" "$symbols" "$readme" "$checksums" "$archive"

echo "Assembling $config with $rgbds_version"
rgbasm -h -L -v -o "$object" "$config"
rgblink -m "$map" -n "$symbols" -d -o "$rom" "$object"
rgbfix -v "$rom"

sha256_file() {
  if command -v sha256sum >/dev/null 2>&1; then
    sha256sum "$1" | awk '{print $1}'
  else
    shasum -a 256 "$1" | awk '{print $1}'
  fi
}

rom_hash="$(sha256_file "$rom")"
rom_size="$(wc -c < "$rom" | tr -d '[:space:]')"
revision="unknown"
if command -v git >/dev/null 2>&1 && git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  revision="$(git describe --always --dirty)"
fi

printf '%s  %s\n' "$rom_hash" "$(basename "$rom")" > "$checksums"
printf '%s\n' \
  "KOF96 Game Boy ROM" \
  "Variant: $description" \
  "Configuration: $config" \
  "Source revision: $revision" \
  "Toolchain: $rgbds_version" \
  "ROM size: $rom_size bytes" \
  "ROM SHA-256: $rom_hash" > "$readme"

(
  cd "$out_dir"
  zip -q -X "$archive_name" "$(basename "$rom")" README.txt SHA256SUMS
)

archive_hash="$(sha256_file "$archive")"
echo "Built $rom"
echo "$rom_hash  $rom"
echo "Packaged $archive"
echo "$archive_hash  $archive"
