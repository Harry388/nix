{ util, ... }@confInps: util.mkModule { 
    inherit confInps;
    name = "steam";
} {

    programs.steam = {
        enable = true;
        remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
        dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    };

}
