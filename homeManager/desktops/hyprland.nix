{ lib, config, pkgs, inputs, ... }:

let
    cfg = config.hyprlandHome;
in
{
    options.hyprlandHome = {
        enable = lib.mkEnableOption "enables hyprland settings";
    };

    config = lib.mkIf cfg.enable {

        wayland.windowManager.hyprland = {
            enable = true;
            settings = {
                "$terminal" = "alacritty";

                env = [
                    "XCURSOR_SIZE,24"
                    "HYPRCURSOR_SIZE,24"
                ];

                decoration = {
                    rounding = 10;
                    
                    drop_shadow = true;
                    shadow_range = 4;
                    shadow_render_power = 3;
                };

                input = {
                    "kb_layout" = "gb";
                };
                
                "$mainMod" = "SUPER";
                "$menu" = "wofi --show drun";

                bind = [
                    "$mainMod, T, exec, $terminal"
                    "$mainMod, R, exec, $menu"
                    "$mainMod, Q, killactive"
                    "$mainMod, M, exit"

                    "$mainMod, h, movefocus, l"
                    "$mainMod, l, movefocus, r"
                    "$mainMod, k, movefocus, u"
                    "$mainMod, j, movefocus, d"

                    "$mainMod SHIFT, h, movewindow, l"
                    "$mainMod SHIFT, l, movewindow, r"
                    "$mainMod SHIFT, k, movewindow, u"
                    "$mainMod SHIFT, j, movewindow, d"

                    "$mainMod, f, fullscreen"
                    "$mainMod, g, togglefloating"
                ];

            };
        };

        home.packages = with pkgs; [
            wofi
        ];

    };
}
