{ lib, config, pkgs, ... }:

let 
    cfg = config.stylix;
in
{

    options.stylix = {
        enable = lib.mkEnableOption "enables stylix";
    };

    config = lib.mkIf cfg.enable {

        stylix.targets = {
            gtk.extraCss = ./gtk.css;
        };

    };

}
