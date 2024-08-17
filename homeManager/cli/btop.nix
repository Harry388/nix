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
                color_theme = lib.mkForce "gruvbox_material_dark";
                vim_keys = true;
            };
        };
    };
}
