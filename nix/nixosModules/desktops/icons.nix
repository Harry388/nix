inputs: { pkgs, lib, config, ... }:

let
    cfg = config.env.icons;
in
{

    options.env.icons = {

        cursor = lib.mkOption {
            type = lib.types.str;
            default = "macOS";
        };

        cursorSize = lib.mkOption {
            type = lib.types.int;
            default = 24;
        };

        theme = lib.mkOption {
            type = lib.types.str;
            default = "Papirus-Dark";
        };

        colourScheme = lib.mkOption {
            type = lib.types.str;
            default = "prefer-dark";
        };

    };

    config = {

        environment.systemPackages = with pkgs; [
            apple-cursor
            banana-cursor
            papirus-icon-theme
        ];

        xdg.icons.fallbackCursorThemes = [
            cfg.cursor
        ];

        # NOTE: icon theme is also set in:
        # environment/config/gtk-3.0/settings.ini
        # environment/config/gtk-4.0/settings.ini
        # environment/config/vicinae/settings.json

        programs.dconf.profiles.user.databases = [
            {
                settings = {
                    "org/gnome/desktop/interface" = {
                        icon-theme = cfg.theme;
                        color-scheme = cfg.colourScheme;
                        cursor-theme = cfg.cursor;
                        cursor-size = lib.gvariant.mkInt32 cfg.cursorSize;
                    };
                };
            }
        ];

        environment.variables = {
            XCURSOR_THEME = cfg.cursor;
            XCURSOR_SIZE = cfg.cursorSize;
        };

    };

}
