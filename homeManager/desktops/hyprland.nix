{ lib, config, pkgs, inputs, ... }:

let
    cfg = config.hyprlandHome;
    css = ''
    * {
        border: none;
        border-radius: 0px;
        font-family: "JetBrainsMono Nerd Font";
        font-weight: bold;
        font-size: 14px;
        min-height: 0px;
    }

    window#waybar {
    }

    tooltip {
        background: @theme_unfocused_base_color;
        color: @theme_text_color;
        border-radius: 10px;
        border-width: 1px;
        border-style: solid;
        border-color: shade(alpha(@theme_text_colors, 0.9), 1.25);
    }

    #workspaces button {
        box-shadow: none;
    	text-shadow: none;
        padding: 0px;
        border-radius: 7px;
        padding-right: 0px;
        padding-left: 4px;
        margin-right: 7px;
        margin-left: 7px;
        color: @theme_text_color;
        animation: gradient_f 2s ease-in infinite;
        transition: all 0.2s cubic-bezier(.55,-0.68,.48,1.682);
    }

    #workspaces button.active {
        color: @accent_color;
        animation: gradient_f 20s ease-in infinite;
        transition: all 0.3s cubic-bezier(.55,-0.68,.48,1.682);
    }

    #workspaces button:hover {
        color: @accent_color;
        animation: gradient_f 20s ease-in infinite;
        transition: all 0.3s cubic-bezier(.55,-0.68,.48,1.682);
    }

    #cpu,
    #memory,
    #custom-power,
    #clock,
    #workspaces,
    #window,
    #custom-updates,
    #network,
    #bluetooth,
    #pulseaudio,
    #custom-wallchange,
    #custom-mode,
    #tray {
        color: @theme_text_color;
        background: shade(alpha(@theme_text_colors, 0.9), 1.25);
        opacity: 1;
        padding: 0px;
        margin: 3px 3px 3px 3px;
    }

    #custom-battery {
        color: @green_1
    }

    /* resource monitor block */

    #cpu {
        border-radius: 10px 0px 0px 10px;
        margin-left: 25px;
        padding-left: 12px;
        padding-right: 4px;
    }

    #memory {
        border-radius: 0px 10px 10px 0px;
        border-left-width: 0px;
        padding-left: 4px;
        padding-right: 12px;
        margin-right: 6px;
    }


    /* date time block */
    #clock {
        color: @yellow_1;
        padding-left: 12px;
        padding-right: 12px;
    }


    /* workspace window block */
    #workspaces {
        border-radius: 9px 9px 9px 9px;
        background: mix(@theme_unfocused_base_color,white,0.1);
    }

    #window {
        /* border-radius: 0px 10px 10px 0px; */
        /* padding-right: 12px; */
    }


    /* control center block */
    #custom-updates {
        border-radius: 10px 0px 0px 10px;
        margin-left: 6px;
        padding-left: 12px;
        padding-right: 4px;
    }

    #network {
        color: @purple_1;
        padding-left: 4px;
        padding-right: 4px;
    }

    #language {
        color: @orange_1;
        padding-left: 9px;
        padding-right: 9px;
    }

    #bluetooth {
        color: @blue_1;
        padding-left: 4px;
        padding-right: 0px;
    }

    #pulseaudio {
        color: @purple_1;
        padding-left: 4px;
        padding-right: 4px;
    }

    #pulseaudio.microphone {
        color: @red_1;
        padding-left: 0px;
        padding-right: 4px;
    }


    /* system tray block */
    #custom-mode {
        border-radius: 10px 0px 0px 10px;
        margin-left: 6px;
        padding-left: 12px;
        padding-right: 4px;
    }

    #custom-logo {
        margin-left: 6px;
        padding-right: 4px;
        color: @blue_1;
        font-size: 16px;

    }

    #tray {
        padding-left: 4px;
        padding-right: 4px;
    }
  '';
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
                "$mainMod" = "SUPER";
                "$menu" = "fuzzel";

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

            };
        };

        programs.waybar = {
            enable = true;
            style = css;
            settings = {
                mainBar = {
                    "hyprland/workspaces" = {
                        format = "{icon}";
                        format-icons = {
                            "1" = "";
                            "2" = "";
                            "3" = "";
                            active = "";
                            default = "";
                            urgent = "";
                        };
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
                        "pulseaudio#microphone"
                        "clock"
                        "tray"
                    ];
                };
            };
        };

        home.packages = with pkgs; [
            fuzzel
            waybar
        ];

    };
}
