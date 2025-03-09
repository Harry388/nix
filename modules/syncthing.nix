{ util, pkgs, ... }@confInps: util.mkModule {
    inherit confInps;
    name = "syncthing";
} {

    services.syncthing = {
        enable = true;
        settings = {
            folders = {
                "sync" = {
                    path = "/home/harry/sync";
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
