inputs: { config, lib, pkgs, ... }:

let
    cfg = config.env.homeServer;
    home = config.users.users.${cfg.user}.home;
    services = [ "immich" "navidrome" "radicale" "syncthing" ];
    shouldBackupService = service: cfg.services.${service}.backup && cfg.services.${service}.enable;
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
            default = "/etc/restic/env";
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
            description = "Restic Backup Service";

            serviceConfig = {
                Type = "oneshot";
                User = "restic";
                Group = "restic";
                EnvironmentFile = cfg.resticEnvironmentFile;
                ExecStart = map
                    (service: "${pkgs.restic}/bin/restic backup ${cfg.services.${service}.serviceLocation} --tag ${service}")
                    (builtins.filter shouldBackupService services);

                AmbientCapabilities = [ "CAP_DAC_READ_SEARCH" ];
                CapabilityBoundingSet = [ "CAP_DAC_READ_SEARCH" ];

                PrivateTmp = true;
                ProtectSystem = "strict";
                ProtectHome = "read-only";
            };
        };

        systemd.services.restic-backup-wrapper = {
            description = "Restic Backup Wrapper Service";

            serviceConfig = {
                Type = "oneshot";
                ExecStart = builtins.filter
                    (command: command != "")
                    [
                        (if shouldBackupService "immich" then "${pkgs.systemd}/bin/systemctl stop podman-compose-immich-root" else "")
                        (if shouldBackupService "navidrome" then "${pkgs.systemd}/bin/systemctl stop podman-compose-navidrome-root" else "")
                        (if shouldBackupService "radicale" then "${pkgs.systemd}/bin/systemctl stop podman-compose-radicale-root" else "")
                        (if shouldBackupService "syncthing" then "${pkgs.systemd}/bin/systemctl stop syncthing" else "")
                        "${pkgs.systemd}/bin/systemctl start restic-backup --wait"
                        (if shouldBackupService "immich" then "${pkgs.systemd}/bin/systemctl start podman-compose-immich-root" else "")
                        (if shouldBackupService "navidrome" then "${pkgs.systemd}/bin/systemctl start podman-compose-navidrome-root" else "")
                        (if shouldBackupService "radicale" then "${pkgs.systemd}/bin/systemctl start podman-compose-radicale-root" else "")
                        (if shouldBackupService "syncthing" then "${pkgs.systemd}/bin/systemctl start syncthing" else "")
                    ];

                PrivateTmp = true;
                ProtectSystem = "strict";
                ProtectHome = "tmpfs";
            };
        };

        systemd.timers.homeserver-backup = {
            description = "System Backup Timer";
            wantedBy = [ "timers.target" ];

            timerConfig = {
                OnCalendar = "*-*-* 04:00:00";
                Unit = "restic-backup-wrapper.service";
            };
        };

    };

}
