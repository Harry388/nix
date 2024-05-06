{ lib, config, pkgs, ... }:

let
    cfg = config.gnomeHome;
in
{
    options.gnomeHome = {
        enable = lib.mkEnableOption "enables gnome settings";
    };

    config = lib.mkIf cfg.enable {
        dconf.settings = {
            "org/gnome/desktop/interface" = {
                color-scheme = "prefer-dark";
                icon-theme = "Papirus-Dark";
            };

            "org/gnome/shell" = {
                favorite-apps = [
                    "google-chrome.desktop"
                    "org.gnome.Nautilus.desktop"
                    "org.gnome.Console.desktop"
                    "spotify.desktop"
                    "gittyup.desktop"
                ];

                disable-user-extensions = "false";

                enabled-extensions = [
                    "blur-my-shell@aunetx"
                ];
            };

            "org/gnome/shell/extensions/blur-my-shell/panel" = {
                blur = false;
            };

            "org/gnome/desktop/peripherals/touchpad" = {
                tap-to-click = true;
                natural-scroll = true;
            };

            "org/gnome/desktop/background" = {
                color-shading-type = "solid";
                picture-options = "zoom";
                picture-uri = "file:///home/harry/Pictures/background.jpg";
                picture-uri-dark = "file:///home/harry/Pictures/background.jpg";
            };

            "org/gnome/desktop/screensaver" = {
                color-shading-type = "solid";
                picture-options = "zoom";
                picture-uri = "file:///home/harry/Pictures/background.jpg";
                picture-uri-dark = "file:///home/harry/Pictures/background.jpg";
            };

        };

        home.packages = with pkgs; [
            papirus-icon-theme
            gnomeExtensions.blur-my-shell
            gnomeExtensions.dash-to-panel
        ];
    };
}
