{ util, ... }@confInps: util.mkModule {
    inherit confInps;
    name = "smallGnome";
} {

    services.xserver = {
        enable = true;
    };

    services.displayManager.gdm.enable = true;

    services.gnome.gnome-keyring.enable = true;
    services.gvfs.enable = true;

    security.pam.services.gdm.enableGnomeKeyring = true;

}
