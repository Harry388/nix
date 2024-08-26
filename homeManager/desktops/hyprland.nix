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
                "$browser" = "steam-run ~/zen/zen";

                "exec-once" = [
                    "waybar"
                    "nm-applet --indicator"
                    "blueman-applet"
                ];

                "windowrule" = [
                    "float,^(pavucontrol)$"
                    "float,^(calculator)$"
                ];

                env = [
                    "XCURSOR_SIZE,24"
                    "HYPRCURSOR_SIZE,24"
                    "HYPRCURSOR_THEME,macOS-BigSur"
                ];

                general = {
                    "gaps_out" = 10;
                    "col.active_border" = "rgb(8ec07c)";
                    "border_size" = 2;
                };

                cursor = {
                    "no_hardware_cursors" = true;
                };

                decoration = {
                    rounding = 10;
                    
                    drop_shadow = false;
                };

                animation = "global,1,2.5,default";

                input = {
                    "kb_layout" = "gb";
                    touchpad = {
                        "natural_scroll" = true;
                    };
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

                    ",XF86MonBrightnessDown,exec,brightnessctl set 5%-"
                    ",XF86MonBrightnessUp,exec,brightnessctl set +5%"

                    ",Print, exec, grimblast --freeze copy area"
                    "$mainMod, p, exec, grimblast --freeze copy area"

                    "$mainMod, x, exec, curl https://linode.cookbook.org.uk/light"
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

        services.hyprpaper = {
            enable = true;
            settings = {
                preload = [ "~/Pictures/background" ];
                wallpaper = [ ", ~/Pictures/background" ];
            };
        };

        home.pointerCursor = {
            gtk.enable = true;
            x11.enable = true;
            package = pkgs.apple-cursor;
            name = "macOS-BigSur";
            size = 24;
        };

        programs.waybar = {
            enable = true;
            settings = {
                mainBar = {
                    layer = "top";
                    position = "top";
                    mode = "dock";
                    height = 20;
                    margin-top = 10;
                    modules-left = ["hyprland/workspaces" "battery" "backlight"];
                    modules-center = ["clock"];
                    modules-right = ["network" "pulseaudio" "tray"];

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
                        sort-by-number = true;
                    };
                    backlight = {
                        device = "intel_backlight";
                        format = "bl: {percent}%";
                    };
                };
            };
            style = ''
* {
    font-family: 'SF Mono', sans-serif;
    font-weight: bold;
    font-size: 10px;
    border-radius: 10px;
}

window#waybar {
    background-color: transparent;
    color: #ebdbb2;
}

.modules-left {
    padding-left: 10px;
    padding-right: 10px;
}

#workspaces {
    background-color: rgba(0,0,0,0.6);
}

#workspaces button {
    padding: 0 15px 0 15px;
    color: #ffffff;
    border: 2px solid rgba(0,0,0,0);
}

#workspaces button.active {
    background-color: #8ec07c;
    color: #282828;
    border: 2px solid #8ec07c;
}

.modules-right {
    padding-right: 10px;
    padding-left: 10px;
}

#battery {
    padding-right: 20px;
    padding-left: 20px;
    margin-right: 15px;
    margin-left: 15px;
    color: #83a598;
    border: 2px solid #83a598;
    background-color: rgba(0,0,0,0.6);
}

#clock {
    padding-right: 20px;
    padding-left: 20px;
    background-color: rgba(0,0,0,0.6);
    color: #b8bb26;
    border: 2px solid #b8bb26;
}

#tray {
    padding-right: 20px;
    padding-left: 20px;
    background-color: rgba(0,0,0,0.6);
    color: #ffffff;
    border: 2px solid #ffffff;
}

#network {
    padding-right: 20px;
    padding-left: 20px;
    background-color: rgba(0,0,0,0.6);
    color: #d3869b;
    border: 2px solid #d3869b;
}

#pulseaudio {
    padding-right: 20px;
    padding-left: 20px;
    margin-left: 15px;
    margin-right: 15px;
    background-color: rgba(0,0,0,0.6);
    color: #fabd2f;
    border: 2px solid #fabd2f;
}

#backlight {
    padding-right: 20px;
    padding-left: 20px;
    background-color: rgba(0,0,0,0.6);
    color: #fe8019;
    border: 2px solid #fe8019;
}
            '';
        };

        home.packages = with pkgs; [
            fuzzel
            waybar
            playerctl
            pavucontrol
            brightnessctl
            grimblast
            networkmanagerapplet
            blueman
        ];

    };
}
