{ lib, config, ... }:

let
    cfg = config.defaultHomeDesktop;
in
{
    imports =[
        ./gnome.nix
        ./stylix.nix
    ];

    options.defaultHomeDesktop = {
        enable = lib.mkEnableOption "enables desktop";
    };

    config = lib.mkIf cfg.enable {
        gnomeHome.enable = lib.mkDefault true;
        stylix.enable = lib.mkDefault true;
    };
}
