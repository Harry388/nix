{ config, lib, ... }:

let
    cfg = config.defaultApps;
in
{
    imports = [
        ./steam.nix
    ];

    options.defaultApps = {
        enable = lib.mkEnableOption "enables apps";
    };

    config = lib.mkIf cfg.enable {
        steam.enable = lib.mkDefault true;
    };
}
