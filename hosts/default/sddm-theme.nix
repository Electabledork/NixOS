{ pkgs, ... }:
let
  imgLink = "https://YOURIMAGELINK/image.png";

  image = pkgs.fetchurl {
    url = imgLink;
    sha256 = "sha256-HrcYriKliK2QN02/2vFK/osFjTT1NamhGKik3tozGU0=";
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
    cd $out/
    rm background.jpg
    cp -r ${image} $out/background.jpg
  '';
}
