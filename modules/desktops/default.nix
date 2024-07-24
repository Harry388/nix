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
    ];

    options.defaultDesktop = {
        enable = lib.mkEnableOption "enables desktop";
    };

    config = lib.mkIf cfg.enable {
        kde.enable = lib.mkDefault false;
        gnome.enable = lib.mkDefault false;
        xfcei3.enable = lib.mkDefault true;
        stylixConfig.enable = lib.mkDefault true;
    };
}
