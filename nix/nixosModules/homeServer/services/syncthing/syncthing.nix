inputs: { config, lib, ... }:

let
    cfg = config.env.homeServer.services.syncthing;
    homeServerUser = config.env.homeServer.user;
    syncthingUser = config.services.syncthing.user;
    syncthingUserGroup = config.users.users.${syncthingUser}.group;
    syncthingUserHome = config.users.users.${syncthingUser}.home;
in
{

    options.env.homeServer.services.syncthing = {

        enable = lib.mkEnableOption "syncthing";

        serviceLocation = lib.mkOption {
            type = lib.types.str;
            default = "${config.env.homeServer.servicesLocation}/syncthing";
        };

    };

    config = lib.mkIf cfg.enable {

        systemd.tmpfiles.rules = [
            "d ${cfg.serviceLocation} 0755 ${syncthingUser} ${syncthingUserGroup} - -"
        ];

        services.syncthing = {
            enable = true;
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
                        path = "${cfg.serviceLocation}/sync";
                        devices = [ "desktop" "laptop" "pi" ];
                    };
                };
                options = {
                    localAnnounceEnabled = false;
                    globalAnnounceEnabled = false;
                };
            };
            user = lib.mkDefault homeServerUser;
            group = lib.mkDefault syncthingUserGroup;
            dataDir = syncthingUserHome;
            configDir = "${syncthingUserHome}/.local/state/syncthing";
        };

    };

}
