{ util, pkgs, ... }@confInps: util.mkModule {
    inherit confInps;
    name = "syncthing";
} {

    services.syncthing = {
        enable = true;
        settings = {
            devices = {
                desktop = {
                    id = "LR4PA7T-7SMOYD3-IO5UQZO-3FQQCTB-2X5O4XP-OR5UEG2-32SA5E2-365HZQF";
                    addresses = [
                        "tcp://desktop:22000"
                        "quic://desktop:22000"
                    ];
                };
                laptop = {
                    id = "JL5YEJ2-AEZYV6L-AW3QOB6-OBJ3GHM-DXWPY22-NM635EW-B6QGCC7-3T3G7QL";
                    addresses = [
                        "tcp://laptop:22000"
                        "quic://laptop:22000"
                    ];
                };
                pi = {
                    id = "I2ZV5DI-2XD5J3Y-BAVPKS3-34UTSHH-X3B3ETF-5ND5BFY-QEYRGAN-R4LJCQI";
                    addresses = [
                        "tcp://pi:22000"
                        "quic://pi:22000"
                    ];
                };
            };
            folders = {
                sync = {
                    path = "/home/harry/sync";
                    devices = [ "desktop" "laptop" "pi" ];
                };
            };
            options = {
                localAnnounceEnabled = false;
                globalAnnounceEnabled = false;
            };
        };
    };

}
