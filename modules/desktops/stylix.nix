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

        stylix.polarity = "dark";

        stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";

        stylix.cursor = {
            package = pkgs.bibata-cursors;
            name = "Bibata-Modern-Ice";
        };

    };

}
