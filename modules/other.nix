{ util, ... }@confInps: util.mkModule {
    inherit confInps;
    name = "other";
} {

    services.gnome.gnome-keyring.enable = true;
    services.gvfs.enable = true;
    programs.zsh.enable = true;

}
