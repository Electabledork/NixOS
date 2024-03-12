{ pkgs, ... }:
let
  imgLink = "https://raw.githubusercontent.com/Electabledork/Wallpapers/main/static/cyberpunk.png";

  image = pkgs.fetchurl {
    url = imgLink;
    sha256 = "sha256-+2H6xuS3hZk6Lk2I9nlC9vW3sAhliQ4hqAlFvLe1hGk=";
  };
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
  '';
}
