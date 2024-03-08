{ pkgs, ... }:
{
    programs.mpv = {
        enable = true;

        config = {
            fs = "no";
            keep-open = "yes";
            force-window = true;
            profile = "gpu-hq";
            volume = 50;
            volume_max = 200;
            deband= "yes";
            deband-iterations = 4;
            deband-threshold = 35;
            deband-range = 16;
            deband-grain = 4;
        };

        bindings = {
            "Alt+<" = "add video-zoom  -0.1";
            "Alt+>" = "add video-zoom  0.1";
        };
    };
}