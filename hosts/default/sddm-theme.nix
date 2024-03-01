{ pkgs, ... }:

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
  '';
}
