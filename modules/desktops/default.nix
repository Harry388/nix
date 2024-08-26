{ config, lib, ... }:

let
    cfg = config.defaultDesktop;
in
{
    imports = [
        ./gnome.nix
        ./kde.nix
        ./stylix.nix
        ./xfcei3.nix
        ./hyprland.nix
    ];

    options.defaultDesktop = {
        enable = lib.mkEnableOption "enables desktop";
    };

    config = lib.mkIf cfg.enable {
        kde.enable = lib.mkDefault false;
        gnome.enable = lib.mkDefault true;
        xfcei3.enable = lib.mkDefault false;
        stylixConfig.enable = lib.mkDefault false;
        hyprland.enable = lib.mkDefault true;
    };
}
