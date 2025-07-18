{ util, ... }@confInps: util.mkModule { 
    inherit confInps;
    name = "xfcei3";
} {

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

}
