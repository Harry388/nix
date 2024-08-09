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

                "$mainMod" = "SUPER";
                "$terminal" = "alacritty";
                "$menu" = "fuzzel";
                "$browser" = "google-chrome-stable";

                "exec-once" = "waybar";

                env = [
                    "XCURSOR_SIZE,24"
                    "HYPRCURSOR_SIZE,24"
                ];

                cursor = {
                    "no_hardware_cursors" = true;
                };

                decoration = {
                    rounding = 10;
                    
                    drop_shadow = true;
                    shadow_range = 4;
                    shadow_render_power = 3;
                };

                animation = "global,1,2.5,default";

                input = {
                    "kb_layout" = "gb";
                };

                bind = [
                    "$mainMod, T, exec, $terminal"
                    "$mainMod, B, exec, $browser"
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

                    "$mainMod, S, togglespecialworkspace, magic"
                    "$mainMod SHIFT, S, movetoworkspace, special:magic"

                    "$mainMod, mouse_down, workspace, e-1"
                    "$mainMod, mouse_up, workspace, e+1"

                    "$mainMod, left, workspace, e-1"
                    "$mainMod, right, workspace, e+1"

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

                bindm = [
                    "$mainMod, mouse:272, movewindow"
                    "$mainMod, mouse:273, resizewindow"
                ];

            };
        };

        programs.waybar = {
            enable = true;
            settings = {
                mainBar = {
                    layer = "top";
                    position = "top";
                    height = 40;
                    margin-top = 15;
                    modules-left = ["battery" "pulseaudio" "backlight"];
                    modules-center = ["hyprland/workspaces"];
                    modules-right = ["network" "clock"];

                    battery = {
                        format = "bat: {capacity}%";
                        format-charging = "charging: {capacity}%";
                    };
                    clock = {
                        format= "{:%I:%M %p}";
                        format-alt = "{:%a, %d. %b  %I:%M %p}";
                    };
                    pulseaudio = {
                        format = "vol: {volume}%";
                        format-bluetooth = "blu: {volume}%";
                        format-muted = "vol: muted";
                        scroll-step = 1;
                        on-click = "pavucontrol";
                        ignored-sinks = ["Easy Effects Sink"];
                    };
                    network = {
                        format = "{ifname}";
                        format-wifi = "wifi: {essid}";
                        format-ethernet = "eth: {ipaddr}/{cidr}";
                        format-disconnected = "disconnected";
                        max-length = 50;
                    };
                    "hyprland/workspaces" = {
                        format = "{icon}";
                        on-click = "activate";
                        format-icons = {
                            "1" = "一";
                            "2" = "二";
                            "3" = "三";
                            "4" = "四";
                            "5" = "五";
                            "6" = "六";
                            "7" = "七";
                            "8" = "八";
                            "9" = "九";
                            "10" = "十";
                        };
                        sort-by-number = true;
                    };
                    backlight = {
                        device = "intel_backlight";
                        format = "bl: {percent}%";
                    };
                };
            };
        };

        home.packages = with pkgs; [
            fuzzel
            waybar
            playerctl
        ];

    };
}
