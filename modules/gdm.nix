{ util, ... }@confInps: util.mkModule {
    inherit confInps;
    name = "gdm";
} {

    services.xserver = {
        enable = true;
        displayManager.gdm.enable = true;
    };

}
