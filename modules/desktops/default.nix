{ config, lib, ... }:

let
    cfg = config.defaultDesktop;
in
{
    imports = [
        ./gnome.nix
        ./kde.nix
        ./stylix.nix
    ];

    options.defaultDesktop = {
        enable = lib.mkEnableOption "enables desktop";
    };

    config = lib.mkIf cfg.enable {
        kde.enable = lib.mkDefault true;
        gnome.enable = lib.mkDefault false;
        stylixConfig.enable = lib.mkDefault true;
    };
}
