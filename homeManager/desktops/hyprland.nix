{ util, pkgs, ... }@confInps: util.mkModule { 
    inherit confInps;
    name = "hyprlandHome";
} {

    wayland.windowManager.hyprland = {
        enable = true;
        settings = {

            "$mainMod" = "SUPER";
            "$terminal" = "ghostty";
            "$menu" = "ulauncher-toggle";
            "$browser" = "zen";
            "$lifx" = "lifx 192.168.1.252 d073d5303445 toggle";
            # "$borderColour" = "rgb(8ec07c)";
            # "$borderColour" = "rgb(ce8d25)";
            "$borderColour" = "rgb(fce99f)";

            "exec-once" = [
                "hyprpaper"
                "waybar"
                "nm-applet --indicator"
                "blueman-applet"
                "swaync"
                "udiskie"
                "ulauncher"
            ];

            windowrulev2 = [
                "float, title:(Calculator)"
                "float, class:(pavucontrol)"
                "float, title:(Firefox - Choose User Profile)"
            ];

            general = {
                "gaps_out" = 0;
                "gaps_in" = 0;
                "col.active_border" = "$borderColour";
                "border_size" = 0;
            };

            cursor = {
                "no_hardware_cursors" = true;
            };

            layerrule = [
                "blur, waybar"
                "blur, launcher"
            ];

            decoration = {
                rounding = 0;
                blur = {
                    enabled = true;
                    size = 7;
                    passes = 4;
                    new_optimizations = "on";
                };
                shadow = {
                    enabled = false;
                };
            };

            bezier = "myBezier, 0.10, 0.9, 0.1, 1.05";

            animation = [
                "workspaces, 0, 2.5, default"
                "windows, 1, 5, myBezier"
                "windowsOut, 1, 5, myBezier"
                "border, 1, 10, default"
                "fade, 1, 3, default"
            ];

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
                "$mainMod, X, exec, $lifx"
                "$mainMod, N, exec, swaync-client -t"

                "$mainMod, h, movefocus, l"
                "$mainMod, j, movefocus, d"
                "$mainMod, k, movefocus, u"
                "$mainMod, l, movefocus, r"

                "$mainMod SHIFT, h, movewindow, l"
                "$mainMod SHIFT, j, movewindow, d"
                "$mainMod SHIFT, k, movewindow, u"
                "$mainMod SHIFT, l, movewindow, r"

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

                "$mainMod, period, exec, bemoji -t"
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

    home.pointerCursor = {
        gtk.enable = true;
        x11.enable = true;
        sway.enable = true;
        package = pkgs.banana-cursor;
        name = "Banana";
        size = 32;
        # package = pkgs.apple-cursor;
        # name = "macOS";
        # size = 24;
    };

    gtk = {
        enable = true;

        iconTheme = {
            package = pkgs.papirus-icon-theme;
            name = "Papirus-Dark";
        };
    };

    home.packages = with pkgs; [
        hyprpaper
        fuzzel
        waybar
        playerctl
        pavucontrol
        brightnessctl
        grimblast
        networkmanagerapplet
        swaynotificationcenter
        waybar
        ulauncher
    ];

}
