{ util, ... }@confInps: util.mkModule {
    inherit confInps;
    name = "keyring";
} {

    services.gnome.gnome-keyring.enable = true;

}
