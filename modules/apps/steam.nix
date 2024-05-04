{ config, lib, ... }:

let
    cfg = config.steam;
in
{

    options.steam = {
        enable = lib.mkEnableOption "enables steam";
    };

    config = lib.mkIf cfg.enable {
        programs.steam = {
            enable = true;
            remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
            dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
        };
    };

}
