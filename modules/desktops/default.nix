{ config, lib, ... }:

let
    cfg = config.defaultDesktop;
in
{
    imports = [
        ./gnome.nix
        ./stylix.nix
    ];

    options.defaultDesktop = {
        enable = lib.mkEnableOption "enables desktop";
    };

    config = lib.mkIf cfg.enable {
        gnome.enable = lib.mkDefault true;
        stylix.enable = lib.mkDefault true;
    };
}
