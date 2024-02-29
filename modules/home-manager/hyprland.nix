{ pkgs, lib, config, inputs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;

    settings = {
      "$terminal" = "kitty";
      "$fileManager" = "nnn";
      "$menu" = "rofi -show drun";
      "source" = "~/.config/hypr/rose-pine-moon.conf";

      exec-once = [
        "discord"
      ];

      monitor = [
       	"DP-1, 1920x1080@75, 0x0, 1"
	"DP-2, 1920x1080@75, -1080x-448, 1, transform, 3"
	"HDMI-A-1, 1920x1080@60, 1920x0, 1"
        ",preferred,auto,1"
      ];

      general = {
        layout = "dwindle";
        resize_on_border = true;
	gaps_in = 5;
	gaps_out = 10;
	border_size = 2;
	"col.active_border" = "$rose $pine $love $iris 90deg";
	"col.inactive_border" = "$muted";
      };

      decoration = {
        rounding = 10;
	blur = {
          enabled = true;
	  size = 3;
	  passes = 1;
	  vibrancy = 0.1696;
	};
	drop_shadow = "yes";
	shadow_range = 4;
	shadow_render_power = 3;
	"col.shadow" = "rgba(1a1a1aee)";
      };

      animations = {
        enabled = "yes";
	bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        
	animation = [
          "windows, 1, 7, myBezier"
	  "windowsOut, 1, 7, default, popin 80%"
	  "border, 1, 10, default"
	  "borderangle, 1, 8, default"
	  "fade, 1, 7, default"
	  "workspaces, 1, 6, default"
	];
      };

      misc = {
        disable_splash_rendering = true;
        force_default_wallpaper = 1;
      };

      input = {
        kb_layout = "us";
	follow_mouse = 1;
	sensitivity = 0;
	float_switch_override_focus = 2;
      };

      dwindle = {
        pseudotile = "yes";
	preserve_split = "yes";
      };

      master = {
        new_is_master = "yes";
      };

      gestures = {
        workspace_swipe = "no";
      };

      device = {
        name = "glorious-model-o-wireless-1";
	sensitivity = -0.5;
      };

      windowrulev2 = [
        "suppressevent maximize, class:.*"
      ];

      windowrule = [];

      "$mod" = "SUPER";
      bind = [
        "$mod, T, exec, $terminal"
        "$mod, Q, killactive,"
	"$mod, M, exit,"
	"$mod, E, exec, $terminal -e $fileManager"
	"$mod, V, togglefloating,"
	"$mod, R, exec, $menu"
	"$mod, P, pseudo,,"
	"$mod, J, togglesplit, "
	"$mod, B, exec, firefox"
	"$mod, left, movefocus, l"
	"$mod, right, movefocus, r"
	"$mod, up, movefocus, u"
	"$mod, down, movefocus, d"	
	"$mod, S, togglespecialworkspace, magic"
	"$mod SHIFT, S, movetoworkspace, special:magicv"
	"$mod, mouse_down, workspace, e+1"
	"$mod, mouse_up, workspace, e-1"
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
        builtins.concatLists (builtins.genList (
            x: let
              ws = let
                c = (x + 1) / 10;
              in
                builtins.toString (x + 1 - (c * 10));
            in [
              "$mod, ${ws}, workspace, ${toString (x + 1)}"
              "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
            ]
          )
          10)
      );

      bindm = [
	"$mod, mouse:272, movewindow"
	"$mod, mouse:273, resizewindow"
      ];

    };

  };

}
