inputs: { config, lib, pkgs, ... }:

let
    cfg = config.env.homeServer;
    home = config.users.users.${cfg.user}.home;
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

    };

}
