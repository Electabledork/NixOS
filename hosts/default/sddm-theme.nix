{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "lwndhrst";
    repo = "sddm-rose-pine";
    rev = "e8735051bf4a418efaf076f52cb3d7873ccd1509";
    sha256 = "lvdmxjkacv5il8gpdxgw7zbmy442b9wrv47az3yw1wwwd8wr6pzl";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
  '';
}
