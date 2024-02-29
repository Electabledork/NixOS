{ pkgs, ...}:
{
  programs.rofi = with pkgs; {
    enable = true;
    package = rofi-wayland;
    theme = ./rose-pine-moon.rasi;
    plugins = [ 
      rofi-calc
      rofi-top
      rofi-emoji
    ];
    extraConfig = {
        modes = "window,drun,run,ssh,combi,calc";
    };
};
}
