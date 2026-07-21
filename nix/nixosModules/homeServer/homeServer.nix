{ self, ... }: { config, lib, ... }:

let
    cfg = config.env.homeServer;
    home = config.users.users.${cfg.user}.home;
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

}
