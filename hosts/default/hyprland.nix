{ inputs, pkgs, ... }: {
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };

  security = {
    polkit.enable = true;
    pam.services = {
      ags = {};
      paulr.enableGnomeKeyring = true;
    };
  };

  services = {
    udisks2.enable = true;
    gnome.gnome-keyring.enable = true;
    xserver = {
      enable = true;
      displayManager.startx.enable = true;
      displayManager.sddm = {
        enable = true;
        wayland.enable = true;
        theme = "${ import ./sddm-theme.nix { inherit pkgs; }}";
      };
      displayManager.setupCommands = ''
        LEFT='DP-2'
        CENTER='DP-1'
        RIGHT='HDMI-A-1'
        ${pkgs.xorg.xrandr}/bin/xrandr --output $CENTER --primary --output $LEFT --rotate right --left-of $CENTER --output $RIGHT --right-of $CENTER
      '';
    };
  };
}
