{ lib, config, pkgs, ... }:

let 
    cfg = config.xfcei3;
in
{

    options.xfcei3 = {
        enable = lib.mkEnableOption "enables xfcei3";
    };

    config = lib.mkIf cfg.enable {

        services.displayManager.defaultSession = "xfce+i3";

        services.xserver.xkb = {
            layout = "gb";
            variant = "";
        };

        services.xserver = {
            enable = true;   
            desktopManager = {
                xterm.enable = false;
                xfce = {
                    enable = true;
                    noDesktop = true;
                    enableXfwm = false;
                };
            };
            windowManager.i3.enable = true;
        };

    };

}
