{ lib, config, pkgs, ... }:

let
    cfg = config.i3Home;
in
{
    options.i3Home = {
        enable = lib.mkEnableOption "enables i3 settings";
    };

    config = lib.mkIf cfg.enable {

        xsession.windowManager.i3 = {
            enable = true;
            config = {
                keybindings = {
                    "$mod+Shift+h" = "move left";
                    "$mod+Shift+j" = "move down";
                    "$mod+Shift+k" = "move up";
                    "$mod+Shift+l" = "move right";

                    "$mod+h" = "focus left";
                    "$mod+j" = "focus down";
                    "$mod+k" = "focus up";
                    "$mod+l" = "focus right";
                };
            };
        };

    };
}
