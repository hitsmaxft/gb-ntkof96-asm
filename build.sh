#!/usr/bin/env bash
set -euo pipefail

variant="${1:-jp}"
case "$variant" in
  jp)
    config="config-jp.asm"
    output="kof96"
    ;;
  *)
    echo "usage: $0 [jp]" >&2
    exit 2
    ;;
esac

rgbds_version="$(rgbasm --version)"
if [[ "$rgbds_version" != "rgbasm v0.7.0" ]]; then
  echo "RGBDS 0.7.0 is required; found: $rgbds_version" >&2
  echo "Enter the pinned environment with: nix-shell" >&2
  exit 1
fi

echo "Assembling $config with $rgbds_version"
rgbasm -h -L -v -o "$output.o" "$config"
rgblink -m "$output.map" -n "$output.sym" -d -o "$output.gb" "$output.o"
rgbfix -v "$output.gb"

echo "Built $output.gb"
if command -v sha256sum >/dev/null 2>&1; then
  sha256sum "$output.gb"
else
  shasum -a 256 "$output.gb"
fi
