{ util, pkgs, ... }@confInps: util.mkModule {
    inherit confInps;
    name = "syncthing";
} {

    services.syncthing = {
        enable = true;
        settings = {
            folders = {
                documents = {
                    path = "/home/harry/sync/documents";
                };
                photos = {
                    path = "/home/harry/sync/photos";
                };
            };
        };
    };

}
