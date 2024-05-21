{ config, lib, ... }:

let
    cfg = config.defaultHome;
in
{
    imports = [
        ./cli/default.nix
        ./pkgs/default.nix
        ./desktops/default.nix
    ];

    options.defaultHome = {
        enable = lib.mkEnableOption "enables home";
    };

    config = lib.mkIf cfg.enable {
        programs.google-chrome.enable = true;
        defaultHomeCli.enable = true;
        defaultHomePkgs.enable = true;
        defaultHomeDesktop.enable = true;
    };

}
