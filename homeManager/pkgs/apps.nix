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
            discord-screenaudio
            prismlauncher
            spotify
            obsidian
            gittyup
            #dbeaver-bin
            mysql-workbench
            postman
            dolphin-emu
            zed-editor
            bottles
            firefox
            transmission_4-gtk
            vlc
            libreoffice-qt
            clonehero
            hunspell
            hunspellDicts.en_GB-ise
        ];
    };
}
