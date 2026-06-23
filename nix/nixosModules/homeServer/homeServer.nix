{ self, ... }:

{

    flake.nixosModules.homeServer = { pkgs, config, lib, ... }:
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

            # setup /home/user/services/*/* (docker-compose.yml, start, stop, backup for each service)
            systemd.tmpfiles.rules = [
                "d ${cfg.servicesLocation} 0755 ${cfg.user} ${group} - -"
            ] ++ (map (service:
                "d ${cfg.servicesLocation}/${service} 0755 ${cfg.user} ${group} - -"
            ) cfg.services) ++ (lib.lists.flatten (
                map (service:
                    map (file:
                        "L+ ${cfg.servicesLocation}/${service}/${file} 0755 ${cfg.user} ${group} - ${./services/${service}/${file}}"
                    ) (builtins.attrNames (builtins.readDir ./services/${service}))
                ) cfg.services
            ));

            environment.systemPackages = [
                homeServerScript
            ];

            systemd.services.backup-server = {
                description = "Backup server folders";
                path = [
                    pkgs.bash
                    pkgs.docker
                    pkgs.gnutar
                    pkgs.gzip
                ];
                serviceConfig = {
                    Type = "oneshot";
                    ExecStart = "${pkgs.bash}/bin/bash -c '${homeServerBin} backup && ${homeServerBin} clean 2'";
                    User = cfg.user;
                };
            };

            systemd.timers.backup-server = {
                description = "Backup server folders on a timer";
                wantedBy = ["timers.target"];
                timerConfig = {
                    Unit = "backup-server.service";
                    OnCalendar = "Mon *-*-* 04:00:00";
                };
            };

        };

    };

}
