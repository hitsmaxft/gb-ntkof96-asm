{ pkgs ? import <nixpkgs> { } }:

let
  rgbds-0_7_0 = pkgs.stdenv.mkDerivation rec {
    pname = "rgbds";
    version = "0.7.0";

    src = pkgs.fetchurl {
      url = "https://github.com/gbdev/rgbds/archive/refs/tags/v${version}.tar.gz";
      hash = "sha256-7wTSTXp5wF/62sDAghT1m42IEsfRBSpYXlqwFF8JOzA=";
    };

    nativeBuildInputs = with pkgs; [
      bison
      flex
      pkg-config
    ];
    buildInputs = [ pkgs.libpng ];

    installPhase = ''
      runHook preInstall
      make install PREFIX="$out"
      runHook postInstall
    '';
  };
in
pkgs.mkShell {
  packages = with pkgs; [
    rgbds-0_7_0
    php
  ];

  shellHook = ''
    echo "KOF96 development shell: $(rgbasm --version)"
    echo "Build and package the modified Japanese ROM with: make jp"
  '';
}
