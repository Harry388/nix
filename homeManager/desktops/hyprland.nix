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
            };
            plugins = [
                inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprbars
            ];
        };

    };
}
