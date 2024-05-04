{ lib, config, ... }:

let
    cfg = config.defaultHomePkgs;
in
{
    imports =[
        ./apps.nix
        ./languages.nix
        ./tools.nix
    ];

    options.defaultHomePkgs = {
        enable = lib.mkEnableOption "enables pkgs";
    };

    config = lib.mkIf cfg.enable {
        apps.enable = lib.mkDefault true;
        languages.enable = lib.mkDefault true;
        tools.enable = lib.mkDefault true;
    };
}
