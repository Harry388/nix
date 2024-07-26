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

    };

}
