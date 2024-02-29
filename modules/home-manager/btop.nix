{ pkgs, ... }:
{
  xdg.desktopEntries."btop" = {
    name = "btop++";
    comment = "System resource Monitor";
    icon = "${pkgs.btop}/share/icons/hicolor/48x48/apps/btop.png";
    # xterm is a symlink and not actually xterm
    exec = "kitty -e ${pkgs.btop}/bin/btop %F";
    terminal = false;
    mimeType = [ "text/plain" ];
  };
}
