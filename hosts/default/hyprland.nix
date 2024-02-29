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
    pam.services.ags = {};
  };

  environment.systemPackages = with pkgs; [
   #rose-pine-gtk-theme
   #rose-pine-icon-theme
  ];
  
  services = {
    udisks2.enable = true; 
    xserver = {
      enable = true;
      displayManager.startx.enable = true;
      displayManager.sddm = {
        enable = true;
      };
      displayManager.setupCommands = ''
        xrandr --output DP-1 --primary --mode 1920x1080 --rate 75.00
	--output DP-2 --mode 1920x1080 --rate 75.00 --rotate right --left-of DP-1
	--output HDMI-A-1 --mode 1920x1080 --rate 60.00 --right-of DP-1
      '';
    };
  };
}
