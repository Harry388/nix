{ util, pkgs, ... }@confInps: util.mkModule {
    inherit confInps;
    name = "syncthing";
} {

    services.syncthing = {
        enable = true;
        settings = {
            folders = {
                documents = {
                    path = "/var/lib/syncthing/documents";
                };
            };
        };
    };

    users.groups = {
        sync = {
            members = [ "harry" "syncthing" ];
        };
    };

}
