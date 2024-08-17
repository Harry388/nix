{ lib, config, ... }:

let
    cfg = config.btop;
in
{
    options.btop = {
        enable = lib.mkEnableOption "enables btop";
    };

    config = lib.mkIf cfg.enable {
        programs.btop = {
            enable = true;
            settings = {
                color_theme = "gruvbox_material_dark";
                theme_background = true;
                vim_keys = "true";
            };
        };
    };
}
