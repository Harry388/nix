{ lib, config, ... }:

let
    cfg = config.alacritty;
in
{
    options.alacritty = {
        enable = lib.mkEnableOption "enables alacritty";
    };

    config = lib.mkIf cfg.enable {
        programs.alacritty = {
            enable = true;

            settings = {
                colors.draw_bold_text_with_bright_colors = false;
                font = {
                    bold = {
                        family = "JetBrainsMono Nerd Font Mono";
                        style = "Bold";
                    };
                    bold_italic = {
                        family = "JetBrainsMono Nerd Font Mono";
                        style = "Bold Italic";
                    };
                    italic = {
                        family = "JetBrainsMono Nerd Font Mono";
                        style = "Italic";
                    };
                    normal = {
                        family = "JetBrainsMono Nerd Font Mono";
                        style = "Regular";
                    };
                    size = 13;
                };
                window.opacity = 0.95;
            };
        };
    };
}

