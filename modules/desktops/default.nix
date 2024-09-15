{ util, lib, ... }@confInps: util.mkModule { 
    inherit confInps;
    name = "defaultDesktop";
    imports = [
        ./gnome.nix
        ./kde.nix
        ./xfcei3.nix
        ./hyprland.nix
    ];
} {

    kde.enable = lib.mkDefault false;
    gnome.enable = lib.mkDefault true;
    xfcei3.enable = lib.mkDefault false;
    hyprland.enable = lib.mkDefault true;

}
