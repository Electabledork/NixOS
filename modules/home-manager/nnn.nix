{ pkgs, ... }:
{
  xdg.desktopEntries."nnn" = {
    name = "nnn";
    comment = "Terminal File Manager";
    icon = "nnn";
    # xterm is a symlink and not actually xterm
    exec = "kitty -e ${pkgs.nnn}/bin/nnn %F";
    terminal = false;
    mimeType = [ "text/plain" ];
  };

  programs.nnn = {
    enable = true;
  };
}
