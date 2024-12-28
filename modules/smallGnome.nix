{ util, ... }@confInps: util.mkModule {
    inherit confInps;
    name = "smallGnome";
} {

    services.xserver = {
        enable = true;
        displayManager.gdm.enable = true;
    };

    services.gnome.gnome-keyring.enable = true;
    services.gvfs.enable = true;

}
