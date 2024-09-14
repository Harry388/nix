{ lib, config, pkgs, inputs, ... }:

let 
    cfg = config.hyprland;
in
{

    options.hyprland = {
        enable = lib.mkEnableOption "enables hyprland";
    };

    config = lib.mkIf cfg.enable {

        programs.hyprland = {
            enable = true;
            package = inputs.hyprland.packages."${pkgs.system}".hyprland;
        };

        nix.settings = {
            substituters = ["https://hyprland.cachix.org"];
            trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
        };

    };

}
