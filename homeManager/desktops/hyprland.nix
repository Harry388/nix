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
                    "kb_layout" = "uk";
                };
                
                "$mainMod" = "SUPER";
                "$menu" = "wofi --show drun";

                bind = [
                    "$mainMod, ENTER, exec, $terminal"
                    "$mainMod, R, exec, $menu"
                ];

            };
        };

        home.packages = with pkgs; [
            wofi
        ];

    };
}
