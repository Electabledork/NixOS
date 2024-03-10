{ config, pkgs, ... }:
let
  username = "paulr";
  homeDirectory = "/home/${username}";
  homeManDir = "/home/${username}/modules/home-manager";
  rosePineCursor = import ./rose-pine-cursor.nix { inherit pkgs; };
in
{
  imports = [
    ./hyprland.nix
    ./ags.nix
    ./packages.nix
    ./neovim/neovim.nix
    ./btop.nix
    ./nnn.nix
    ./rofi/rofi.nix
    ./mpv.nix
    ./cava.nix
    ./starship.nix
    ./blender.nix
  ];

  gtk = {
    enable = true;
  
    theme = {
      package = pkgs.rose-pine-gtk-theme;
      name = "rose-pine";
    };

    iconTheme = {
      package = pkgs.rose-pine-icon-theme;
      name = "rose-pine";
    };

    cursorTheme = {
      package = rosePineCursor;
      name = "BreezeX-RosePine-Linux";
    };
  };

  qt = {
    enable = true;
    platformTheme = "gtk";
  };

  home.pointerCursor.gtk.enable = true;
  home.pointerCursor.package = rosePineCursor;
  home.pointerCursor.name = "BreezeX-RosePine-Linux";

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "electron-25.9.0"
    ];
  };

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;
    };
  };
  
  home = {
    inherit username homeDirectory;

    sessionVariables = {
      NIXPKGS_ALLOW_UNFREE = "1";
      GTK_THEME = "rose-pine-moon";
    };
  };

  # XDG MIME default applications
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "image/png" = "com.interversehq.qView.desktop";
      "image/jpeg" = "com.interversehq.qView.desktop";
      "image/bmp" = "com.interversehq.qView.desktop";
      "image/webp" = "com.interversehq.qView.desktop";
      "image/*" = "com.interversehq.qView.desktop";
      "video/MP2T" = "mpv.desktop";
    };
  };

  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
}
