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
                window = {
                    decorations = "None";
                    startup_mode = "Maximized";
                    opacity = 0.8;
                    blur = true;
                };
                font.size = 12;
            };
        };
    };
}

