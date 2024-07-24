{ lib, config, ... }:

let
    cfg = config.defaultHomeDesktop;
in
{
    imports =[
        ./gnome.nix
        ./stylix.nix
        ./xfcei3.nix
    ];

    options.defaultHomeDesktop = {
        enable = lib.mkEnableOption "enables desktop";
    };

    config = lib.mkIf cfg.enable {
        gnomeHome.enable = lib.mkDefault false;
        i3Home.enable = lib.mkDefault true;
        stylixConfig.enable = lib.mkDefault true;
    };
}
