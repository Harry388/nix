{ self, ... }: { pkgs, config, lib, ... }:

let
    cfg = config.env.homeServer;
    group = config.users.users.${cfg.user}.group;
in
{

    imports = [
        self.nixosModules.syncthing
        self.nixosModules.immich
        self.nixosModules.navidrome
        self.nixosModules.radicale
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
            default = true;
        };

    };

    config = {

        systemd.tmpfiles.rules = [
            "d ${cfg.servicesLocation} 0755 ${cfg.user} ${group} - -"
        ];

        environment.systemPackages = with pkgs; [
            rclone
        ];

        # systemd.services.backup-server = {
        #     description = "Backup server folders";
        #     path = [
        #         pkgs.bash
        #         pkgs.docker
        #         pkgs.gnutar
        #         pkgs.gzip
        #     ];
        #     serviceConfig = {
        #         Type = "oneshot";
        #         ExecStart = "${pkgs.bash}/bin/bash -c '
        #         SERVICES_LOCATION=${cfg.servicesLocation} ${homeServerBin} backup &&
        #         SERVICES_LOCATION=${cfg.servicesLocation} ${homeServerBin} clean 2
        #         '";
        #     };
        # };

        # systemd.timers.backup-server = {
        #     description = "Backup server folders on a timer";
        #     wantedBy = ["timers.target"];
        #     timerConfig = {
        #         Unit = "backup-server.service";
        #         OnCalendar = "* *-*-* 04:00:00";
        #     };
        # };

    };

}
