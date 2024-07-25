{ lib, config, pkgs, ... }:

let 
    cfg = config.stylixConfig;
in
{

    options.stylixConfig = {
        enable = lib.mkEnableOption "enables stylix";
    };

    config = lib.mkIf cfg.enable {

        stylix.enable = true;

        stylix.image = /home/harry/Pictures/background;

        stylix.polarity = "dark";

        stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest-dark-hard.yaml";

        stylix.cursor = {
            package = pkgs.apple-cursor;
            name = "macOS-BigSur";
        };

        stylix.fonts = {
            serif = {
                package = pkgs.noto-fonts;
                name = "Noto Serif";
            };

            sansSerif = {
                package = pkgs.noto-fonts;
                name = "Noto Sans";
            };

            monospace = {
                package = pkgs.nerdfonts.override { fonts = ["JetBrainsMono"]; };
                name = "JetBrainsMono Nerd Font Mono";
            };

            emoji = {
                package = pkgs.noto-fonts-emoji;
                name = "Noto Color Emoji";
            };

            sizes = {
                terminal = 12;
                applications = 12;
                desktop = 10;
                popups = 10;
            };
        };

        stylix.opacity.terminal = 0.95;

        stylix.targets = {
            # nixvim.enable = false;
        };

    };

}
