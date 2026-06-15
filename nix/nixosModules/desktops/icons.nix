{

    flake.nixosModules.icons = { pkgs, lib, ... }: {

        environment.systemPackages = with pkgs; [
            apple-cursor
            banana-cursor
            papirus-icon-theme
        ];

        xdg.icons.fallbackCursorThemes = [
            "macOS"
        ];

        # NOTE: icon theme is also set in:
        # environment/config/gtk-3.0/settings.ini
        # environment/config/gtk-4.0/settings.ini
        # environment/config/vicinae/settings.json

        programs.dconf.profiles.user.databases = [
            {
                settings = {
                    "org/gnome/desktop/interface" = {
                        icon-theme = "Papirus-Dark";
                        color-scheme = "prefer-dark";
                        cursor-theme = "macOS";
                        cursor-size = lib.gvariant.mkInt32 24;
                    };
                };
            }
        ];

        environment.variables = {
            XCURSOR_THEME = "macOS";
            XCURSOR_SIZE = "24";
        };

    };

}
