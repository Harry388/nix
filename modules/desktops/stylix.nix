{ lib, config, pkgs, ... }:

let 
    cfg = config.stylix;
in
{

    options.stylix = {
        enable = lib.mkEnableOption "enables stylix";
    };

    config = lib.mkIf cfg.enable {

        stylix.image = /home/harry/Pictures/background;

    };

}
