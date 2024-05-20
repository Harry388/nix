{ config, lib, ... }:

let
    cfg = config.defaultModules;
in
{
    imports = [
        ./desktops/default.nix
        ./apps/default.nix
    ];

    options.defaultModules = {
        enable = lib.mkEnableOption "enables modules";
    };

    config = lib.mkIf cfg.enable {
        defaultDesktop.enable = lib.mkDefault true;
        defaultApps.enable = lib.mkDefault true;
    };

}
