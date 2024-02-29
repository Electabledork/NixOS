{ pkgs, ... }:
{
  home.packages = with pkgs; with nodePackages_latest; with jetbrains; [
    # Hyprland / System
    dunst
    pavucontrol
    bluetuith
    wl-gammactl
    wl-clipboard
    wf-recorder
    hyprpicker
    wayshot
    swappy
    slurp
    imagemagick
    swww
    easyeffects


    # General Programs
    mpv
    youtube-music
    qview
    kitty
    firefox
    discord
    betterdiscordctl
    starship


    # Art
    gimp-with-plugins
    krita
    #blender
    inkscape
    aseprite
    ldtk
    #blockbench-electron


    # GameDev
    godot_4
    raylib
    ogre


    # Programming
    webstorm
    rust-rover
    rider
    pycharm-professional
    phpstorm
    idea-ultimate
    clion
    vscodium


    # Languages / Programming Tools
    nodejs
    go
    gcc
    rustup
    dotnet-sdk_8
    mono5
    python3
    haxe
    gnumake
    cmake
    hashlink


    # Music Synth / Daws
    qsynth
    lmms
    ardour
    reaper


    # Image Edit


    # Video Edit

    
    # Office / Notes
    onlyoffice-bin
    obsidian

    # Libs / Tools
    unzip
    zip
    glib
    ffmpeg
    libnotify
    inotify-tools
    killall
    jq
    udiskie
    neofetch
  ];

  #pkgs.rofi-wayland.override {
    #plugins = [ pkgs.rofi-calc ];
  #};
}
