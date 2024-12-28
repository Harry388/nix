{ util, pkgs, ... }@confInps: util.mkModule {
    inherit confInps;
    name = "hyprland";
} {

    programs.hyprland.enable = true;

    services.udisks2.enable = true;

}
