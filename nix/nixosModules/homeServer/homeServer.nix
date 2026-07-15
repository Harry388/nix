{ self, ... }: { pkgs, config, lib, ... }:

let
    cfg = config.env.homeServer;
    homeServerScript = pkgs.writeShellScriptBin "home-server" (builtins.readFile ./home-server);
    homeServerBin = "${homeServerScript}/bin/home-server";
    defaultServices = builtins.attrNames (builtins.readDir ./services);
    home = config.users.users.${config.env.homeServer.user}.home;
    group = config.users.users.${config.env.homeServer.user}.group;
in
{

    imports = [
        self.nixosModules.syncthing
    ];

    options.env.homeServer = {

        user = lib.mkOption {
            type = lib.types.str;
        };

        services = lib.mkOption {
            type = lib.types.listOf lib.types.str;
            default = defaultServices;
        };

        servicesLocation = lib.mkOption {
            type = lib.types.str;
            default = "${home}/services";
        };

    };

    config = {

        virtualisation.docker.enable = true;

        services.syncthing.user = cfg.user;

        env.syncthing.baseDir = "${cfg.servicesLocation}/syncthing/data";

        # setup /home/user/services/*
        systemd.tmpfiles.rules = [
            "d ${cfg.servicesLocation} 0755 ${cfg.user} ${group} - -"
        ] ++ (map (service:
            "d ${cfg.servicesLocation}/${service} 0755 ${cfg.user} ${group} - -"
        ) cfg.services);

        environment.systemPackages = [
            homeServerScript
        ] ++ (with pkgs; [
            rclone
        ]);

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
