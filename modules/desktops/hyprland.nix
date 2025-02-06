{ util, pkgs, ... }@confInps: util.mkModule {
    inherit confInps;
    name = "hyprland";
} {

    programs.hyprland.enable = true;

    programs.xwayland.enable = true;

    services.udisks2.enable = true;

    environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
    };

}
