{ lib, config, pkgs, ... }:

let
    cfg = config.gnomeHome;
    css = ''
button.titlebutton,
windowcontrols > button {
  color: transparent;
  min-width: 16px;
  min-height: 16px;
  box-shadow: inset 0 0 0 1px rgba(0, 0, 0, 0.2);
}

button.titlebutton:backdrop {
  opacity: 0.5;
}

windowcontrols > button {
  border-radius: 100%;
  padding: 0;
  margin: 0 3px;
}

windowcontrols > button > image {
  padding: 0;
}

button.titlebutton {
  margin: 0 2px;
}

.titlebar .right {
  margin-right: 8px;
}

.titlebar .left {
  margin-left: 8px;
}

windowcontrols.end {
  margin-right: 8px;
}

windowcontrols.start {
  margin-left: 8px;
}

button.titlebutton.close, button.titlebutton.close:hover:backdrop,
windowcontrols > button.close,
windowcontrols > button.close:hover:backdrop {
  background-color: #ff605c;
}

button.titlebutton.close:hover,
windowcontrols > button.close:hover {
  background-color: shade(#ff605c,0.9);
}

button.titlebutton.maximize, button.titlebutton.maximize:hover:backdrop,
windowcontrols > button.maximize,
windowcontrols > button.maximize:hover:backdrop {
  background-color: #00ca4e;
}

button.titlebutton.maximize:hover,
windowcontrols > button.maximize:hover {
  background-color: shade(#00ca4e,0.9);
}

button.titlebutton.minimize, button.titlebutton.minimize:hover:backdrop,
windowcontrols > button.minimize,
windowcontrols > button.minimize:hover:backdrop {
  background-color: #ffbd44;
}

button.titlebutton.minimize:hover,
windowcontrols > button.minimize:hover {
  background-color: shade(#ffbd44,0.9);
}

button.titlebutton.close:backdrop, button.titlebutton.maximize:backdrop, button.titlebutton.minimize:backdrop,
windowcontrols > button.close:backdrop,
windowcontrols > button.maximize:backdrop,
windowcontrols > button.minimize:backdrop {
  background-color: #c0bfc0;
}'';
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
        ];

        xdg.configFile."gtk-4.0/gtk.css" = {
            text = css;
        };

        xdg.configFile."gtk-3.0/gtk.css" = {
            text = css;
        };    
    };
}
