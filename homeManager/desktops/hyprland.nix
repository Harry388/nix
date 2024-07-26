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
                
                "$mainMod" = "SUPER";

                bind = [
                    "$mainMod, Q, exec, $terminal"
                ];

            };
        };

    };
}
