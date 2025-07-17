{ util, pkgs, config, ... }@confInps: util.mkModule {
    inherit confInps;
    name = "syncthing";
} {

    services.syncthing = {
        enable = true;
        settings = {
            devices = {
                desktop = {
                    id = "7OKHHUD-JCVRHB3-FMSFDEX-UJUXCAP-YOGSIED-LFCRZQ3-RSGWEUV-RJFDOQQ";
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
                    path = "${config.home.homeDirectory}/sync";
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
