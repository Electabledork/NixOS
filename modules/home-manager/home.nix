{ config, pkgs, ... }:
let
  username = "paulr";
  homeDirectory = "/home/${username}";
  homeManDir = "/home/${username}/modules/home-manager";
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
  ];

  gtk = {
    enable = true;
  
    theme = {
      package = pkgs.rose-pine-gtk-theme;
      name = "rose-pine-moon";
    };

    iconTheme = {
      package = pkgs.rose-pine-icon-theme;
      name = "rose-pine-moon";
    };
  };

  qt.enable = true;

  nixpkgs.config.allowUnfree = true;
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

  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
}
