{ util, pkgs, ... }@confInps: util.mkModule {
    inherit confInps;
    name = "syncthing";
} {

    services.syncthing = {
        enable = true;
        settings = {
            devices = {
                desktop = { id = "LR4PA7T-7SMOYD3-IO5UQZO-3FQQCTB-2X5O4XP-OR5UEG2-32SA5E2-365HZQF"; };
                laptop = { id = "JL5YEJ2-AEZYV6L-AW3QOB6-OBJ3GHM-DXWPY22-NM635EW-B6QGCC7-3T3G7QL"; };
            };
            folders = {
                documents = {
                    path = "/home/harry/sync/documents";
                    devices = [ "desktop" "laptop" ];
                };
                photos = {
                    path = "/home/harry/sync/photos";
                    devices = [ "desktop" ];
                };
            };
        };
    };

}
