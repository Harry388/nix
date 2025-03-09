{ util, pkgs, ... }@confInps: util.mkModule {
    inherit confInps;
    name = "tailscale";
} {

    services.tailscale.enable = true;

}
