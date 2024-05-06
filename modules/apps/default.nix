{ config, lib, ... }:

let
    cfg = config.defaultApps;
in
{
    imports = [
        ./steam.nix
        ./vial.nix
    ];

    options.defaultApps = {
        enable = lib.mkEnableOption "enables apps";
    };

    config = lib.mkIf cfg.enable {
        steam.enable = lib.mkDefault true;
        vial.enable = lib.mkDefault true;
    };
}
