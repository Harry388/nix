{ lib, config, pkgs, ...}:

let
    cfg = config.apps;
in
{
    options.apps = {
        enable = lib.mkEnableOption "enables apps";
    };

    config = lib.mkIf cfg.enable {
        home.packages = with pkgs; [
            discord
            prismlauncher
            spotify
            obsidian
            gittyup
            dbeaver
            dolphin-emu
            zed-editor
        ];
    };
}
