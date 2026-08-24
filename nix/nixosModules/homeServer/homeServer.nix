inputs: { config, lib, pkgs, ... }:

let
    cfg = config.env.homeServer;
    home = config.users.users.${cfg.user}.home;
    services = [ "immich" "navidrome" "radicale" "syncthing" ];
in
{

    imports = [
        (import ./services/immich/_immich.nix inputs)
        (import ./services/navidrome/_navidrome.nix inputs)
        (import ./services/radicale/_radicale.nix inputs)
        (import ./services/syncthing/_syncthing.nix inputs)
    ];

    options.env.homeServer = {

        user = lib.mkOption {
            type = lib.types.str;
        };

        servicesLocation = lib.mkOption {
            type = lib.types.str;
            default = "${home}/services";
        };

        backup = lib.mkOption {
            type = lib.types.bool;
            default = false;
        };

        resticEnvironmentFile = lib.mkOption {
            type = lib.types.str;
            default = "etc/restic/env";
        };

    };

    config = lib.mkIf cfg.backup {

        environment.systemPackages = with pkgs; [
            restic
        ];

        users.groups.restic = {};

        users.users.restic = {
            isSystemUser = true;
            group = "restic";
            description = "Restic backup runner";
        };

        systemd.services.restic-backup = {
            description = "System Backup Service";
            wantedBy = [ "multi-user.target" ];

            serviceConfig = {
                Type = "oneshot";
                User = "restic";
                Group = "restic";
                EnvironmentFile = cfg.resticEnvironmentFile;
                ExecStart = map
                    (service: "${pkgs.restic}/bin/restic backup ${cfg.services.${service}.serviceLocation} --tag ${service}")
                    services;

                AmbientCapabilities = [ "CAP_DAC_READ_SEARCH" ];
                CapabilityBoundingSet = [ "CAP_DAC_READ_SEARCH" ];

                PrivateTmp = true;
                ProtectSystem = "strict";
                ProtectHome = "tmpfs";
            };
        };

    };

}
