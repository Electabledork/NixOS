{ pkgs, ... }:
let
  image = "../../extras/static/mountain1.png";
in
pkgs.stdenv.mkDerivation {
  name = "rose-pine";
  src = pkgs.fetchFromGitHub {
    owner = "lwndhrst";
    repo = "sddm-rose-pine";
    rev = "v1.2";
    sha256 = "+WOdazvkzpOKcoayk36VLq/6lLOHDWkDykDsy8p87JE=";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
    rm $out/background.jpg
    cp -r ${image} $out/background.jpg
    cp -r ${image} $out/background2.jpg
  '';
}
