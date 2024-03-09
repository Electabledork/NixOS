{ pkgs }:
pkgs.stdenv.mkDerivation {
  name = "rose-pine-cursor";
  src = pkgs.fetchurl {
    url = "https://github.com/rose-pine/cursor/releases/download/v1.1.0/BreezeX-RosePine-Linux.tar.xz";
    hash = "sha256-szDVnOjg5GAgn2OKl853K3jZ5rVsz2PIpQ6dlBKJoa8=";
  };

  dotUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons
    tar -xf $src -C $out/share/icons/
  '';
}