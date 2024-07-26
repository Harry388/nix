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
                monitor = [
                    "eDP-1, 1920x1200, 0x0, 1"
                    "HDMI-A-1, 1920x1080, 1920x0, 1"
                ];

                "$mainMod" = "SUPER";
                "$terminal" = "alacritty";
                "$menu" = "fuzzel";
                "$screenshot" = "shutter";

                "exec-once" = "waybar";

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

                bind = [
                    "$mainMod, T, exec, $terminal"
                    "$mainMod, R, exec, $menu"
                    "$mainMod, S, exec, $spectacle"
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

                    "$mainMod, 1, workspace, 1"
                    "$mainMod, 2, workspace, 2"
                    "$mainMod, 3, workspace, 3"
                    "$mainMod, 4, workspace, 4"
                    "$mainMod, 5, workspace, 5"
                    "$mainMod, 6, workspace, 6"
                    "$mainMod, 7, workspace, 7"
                    "$mainMod, 8, workspace, 8"
                    "$mainMod, 9, workspace, 9"
                    "$mainMod, 0, workspace, 10"

                    "$mainMod SHIFT, 1, movetoworkspace, 1"
                    "$mainMod SHIFT, 2, movetoworkspace, 2"
                    "$mainMod SHIFT, 3, movetoworkspace, 3"
                    "$mainMod SHIFT, 4, movetoworkspace, 4"
                    "$mainMod SHIFT, 5, movetoworkspace, 5"
                    "$mainMod SHIFT, 6, movetoworkspace, 6"
                    "$mainMod SHIFT, 7, movetoworkspace, 7"
                    "$mainMod SHIFT, 8, movetoworkspace, 8"
                    "$mainMod SHIFT, 9, movetoworkspace, 9"
                    "$mainMod SHIFT, 0, movetoworkspace, 10"

                    "$mainMod, f, fullscreen"
                    "$mainMod, g, togglefloating"
                ];

                bindel = [
                    ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
                    ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
                ];

                bindl = [
                    ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
                    ", XF86AudioPlay, exec, playerctl play-pause"
                    ", XF86AudioPrev, exec, playerctl previous"
                    ", XF86AudioNext, exec, playerctl next"
                ];

            };
        };

        programs.waybar = {
            enable = true;
            settings = {
                mainBar = {
                    "hyprland/workspaces" = {
                        on-click = "activate";
                    };
                    mod = "dock";
                    layer = "top";
                    gtk-layer-shell = true;
                    height = 14;
                    position = "top";

                    modules-left = ["hyprland/workspaces"];
                    modules-center = [];
                    modules-right = [
                        "network"
                        "bluetooth"
                        "pulseaudio"
                        "clock"
                        "battery"
                        "tray"
                    ];
                };
            };
        };

        home.packages = with pkgs; [
            fuzzel
            waybar
            playerctl
            shutter
        ];

    };
}
