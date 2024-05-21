{ lib, config, pkgs, ... }:

let
    cfg = config.gnomeHome;
in
{
    options.gnomeHome = {
        enable = lib.mkEnableOption "enables gnome settings";
    };

    config = lib.mkIf cfg.enable {
        gtk = {
            enable = true;

            iconTheme = {
                package = pkgs.gruvbox-plus-icons;
                name = "Gruvbox-Plus-Dark";
                # package = pkgs.gruvbox-dark-icons-gtk;
                # name = "oomox-gruvbox-dark";
            };
        };

        dconf.settings = {
            "org/gnome/shell" = {
                favorite-apps = [
                    "google-chrome.desktop"
                    "org.gnome.Nautilus.desktop"
                    "Alacritty.desktop"
                    "spotify.desktop"
                    "gittyup.desktop"
                ];

                disable-user-extensions = "false";

                enabled-extensions = [
                    "user-theme@gnome-shell-extensions.gcampax.github.com"
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

            "org/gnome/desktop/wm/preferences" = {
                button-layout = "appmenu:minimize,maximize,close";
            };
        };

        home.packages = with pkgs; [
            gtk-engine-murrine
            gnomeExtensions.blur-my-shell
            gnomeExtensions.compact-top-bar
        ];

        xdg = {
            enable = true;

            configFile = {
                "gtk-4.0/gtk.css".source = lib.mkForce ./gtk.css;
                "gtk-3.0/gtk.css".source = lib.mkForce ./gtk.css;
            };
        };

    };
}
