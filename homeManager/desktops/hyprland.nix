{ util, pkgs, ... }@confInps: util.mkModule { 
    inherit confInps;
    name = "hyprlandHome";
    imports = [ ./waybar.nix ];
} {

    wayland.windowManager.hyprland = {
        enable = true;
        settings = {

            "$mainMod" = "SUPER";
            "$terminal" = "alacritty";
            "$menu" = "fuzzel";
            "$browser" = "firefox";
            "$browserProfiles" = "firefoxFuzzel";
            "$lifx" = "lifx 192.168.1.252 d073d5303445 toggle";
            # "$borderColour" = "rgb(8ec07c)";
            # "$borderColour" = "rgb(ce8d25)";
            "$borderColour" = "rgb(fce99f)";

            "exec-once" = [
                "waybar"
                "nm-applet --indicator"
                "blueman-applet"
                "swaync"
                "udiskie"
            ];

            windowrulev2 = [
                "float, title:(Calculator)"
                "float, class:(pavucontrol)"
                "float, title:(Firefox - Choose User Profile)"
            ];

            general = {
                "gaps_out" = 8;
                "col.active_border" = "$borderColour";
                "border_size" = 0;
            };

            cursor = {
                "no_hardware_cursors" = true;
            };

            decoration = {
                rounding = 10;
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
                "$mainMod, X, exec, $lifx"
                "$mainMod, E, exec, $browserProfiles"
                "$mainMod, N, exec, swaync-client -t"

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

    services.hyprpaper = {
        enable = true;
        settings = {
            preload = [ "~/nix/wallpaper/house.jpg" ];
            wallpaper = [ ", ~/nix/wallpaper/house.jpg" ];
        };
    };

    home.pointerCursor = {
        gtk.enable = true;
        x11.enable = true;
        package = pkgs.apple-cursor;
        name = "macOS";
        size = 24;
    };

    gtk = {
        enable = true;

        iconTheme = {
            package = pkgs.gruvbox-plus-icons;
            name = "Gruvbox-Plus-Dark";
        };
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
        swaynotificationcenter
    ];

    waybar.enable = true;

}
