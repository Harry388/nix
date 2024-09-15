{ util, lib, ... }@confInps: util.mkModule { 
    inherit confInps;
    name = "defaultHomeDesktop";
    imports = [
        ./gnome.nix
        ./hyprland.nix
    ];
} {

    gnomeHome.enable = lib.mkDefault true;
    hyprlandHome.enable = lib.mkDefault true;

}
