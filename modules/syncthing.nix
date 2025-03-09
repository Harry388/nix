{ util, pkgs, ... }@confInps: util.mkModule {
    inherit confInps;
    name = "syncthing";
} {

    services.syncthing = {
        enable = true;
    };

    users.groups = {
        sync = {
            members = [ "harry" "syncthing" ];
        };
    };

}
