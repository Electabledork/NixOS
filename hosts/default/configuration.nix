{ config, pkgs, stablepkgs, inputs, ... }:
{
  imports =[ 
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
    ./audio.nix
    ./hyprland.nix
    ./locale.nix
  ];

  documentation.nixos.enable = false; # .desktop
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "electron-25.9.0"
    ];
  };
  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };
  };

  # Bootloader.
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
    };
  };

  # Home Manager
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "paulr" = import ../../modules/home-manager/home.nix;
    };
  };

  # Networking
  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

  # bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
    settings.General.Experimental = true; 
  };
  
  # Configure keyboard layout
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

  # Define a user account. 
  users.users.paulr = {
    isNormalUser = true;
    description = "Paul Roberts";
    extraGroups = [ "networkmanager" "wheel" ];
    packages =[ ];
    shell = pkgs.fish;
  };


  # System packages
  environment.systemPackages = [
    pkgs.home-manager
    pkgs.git
    pkgs.wget
    pkgs.libsForQt5.qt5.qtgraphicaleffects
    pkgs.ffmpegthumbnailer
  ];


  # Programs to enable
  programs = {
    fish.enable = true;
    thunar.enable = true;  
    streamdeck-ui = {
      enable = true;
      autoStart = true; # optional
    };
  };

  services.tumbler.enable = true;

  # Fonts
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    dejavu_fonts
  ];
 
 
  # XDG MIME default applications
  xdg.mime = {
    enable = true;
    defaultApplications = {
      "image/png" = "qview.desktop";
      "image/jpeg" = "qview.desktop";
      "video/MP2T" = "mpv.desktop";
    };
  };

  system.stateVersion = "23.11";
}

