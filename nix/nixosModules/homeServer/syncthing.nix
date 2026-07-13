inputs: { config, ... }:

let
    syncthingUser = config.services.syncthing.user;
    syncthingUserHome = config.users.users.${syncthingUser}.home;
in
{

    services.syncthing = {
        enable = true;
        systemService = false;
        settings = {
            devices = {
                desktop = {
                    id = "XSJUEQO-SMKPQO4-KITNZVH-NQRSYSM-5NPFJ6P-VWWIT5B-VJ65GB2-SRMBLQJ";
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
                    path = "${config.users.users.${config.services.syncthing.user}.home}/sync";
                    devices = [ "desktop" "laptop" "pi" ];
                };
            };
            options = {
                localAnnounceEnabled = false;
                globalAnnounceEnabled = false;
            };
        };
        dataDir = syncthingUserHome;
        configDir = "${config.services.syncthing.dataDir}/.local/state/syncthing";
    };

    systemd.user.services.syncthing = {
        enable = true;
        unitConfig.ConditionUser = syncthingUser;
        wantedBy = [ "default.target" ];
    };

}
