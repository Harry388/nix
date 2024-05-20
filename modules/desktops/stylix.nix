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
            package = pkgs.apple-cursor;
            name = "macOS-BigSur-White";
        };

        stylix.fonts = {
            serif = cfg.fonts.sansSerif;

            sansSerif = {
                package = pkgs.noto-fonts;
                name = "Noto Sans";
            };

            monospace = {
                package = pkgs.dejavu_fonts;
                name = "DejaVu Sans Mono";
            };

            emoji = {
                package = pkgs.noto-fonts-emoji;
                name = "Noto Color Emoji";
            };
        };

        stylix.targets.nixvim.enable = false;

    };

}
