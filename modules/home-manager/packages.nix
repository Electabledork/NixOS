{ pkgs, stablepkgs, inputs, ... }:
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
    youtube-music
    qview
    kitty
    firefox
    discord
    betterdiscordctl
    starship
    f1viewer
    obs-studio


    # Art
    gimp-with-plugins
    krita
    #blender
    inkscape
    aseprite
    ldtk
    tiled
    blockbench-electron


    # GameDev
    godot_4
    raylib
    ogre
    love
    sfml
    SDL2
    SDL2_ttf
    SDL2_net
    SDL2_sound
    SDL2_mixer
    SDL2_image


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
    flutter


    # Music Synth / Daws
    qsynth
    lmms
    ardour
    reaper
    hydrogen
    carla


    # Image Edit
    rawtherapee
    darktable


    # Video Edit
    davinci-resolve
    
    
    # Office / Notes
    onlyoffice-bin
    obsidian
    rnote
    xournalpp

    # Libs / Tools
    unzip
    zip
    unrar-wrapper
    glib
    ffmpeg
    libnotify
    inotify-tools
    killall
    jq
    udiskie
    neofetch
    nix-prefetch-git
    yt-dlp
  ];

}
