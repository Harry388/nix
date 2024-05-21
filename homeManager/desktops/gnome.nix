{ lib, config, pkgs, ... }:

let
    cfg = config.gnomeHome;
    gruvboxPlus = import ./gruvbox-plus.nix {inherit pkgs;};
in
{
    options.gnomeHome = {
        enable = lib.mkEnableOption "enables gnome settings";
    };

    config = lib.mkIf cfg.enable {
        gtk = {
            enable = true;

            iconTheme = {
                package = pkgs.gruvbox-dark-icons-gtk;
                name = "icons";
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
        ];
    };
}
