{ util, lib, ... }@confInps: util.mkModule { 
    inherit confInps;
    name = "defaultModules";
    imports = [
        ./desktops/default.nix
        ./apps/default.nix
        ./nvidia.nix
        ./gdm.nix
        ./fonts.nix
        ./other.nix
    ];
} {

    defaultDesktop.enable = lib.mkDefault true;
    defaultApps.enable = lib.mkDefault true;
    nvidia.enable = lib.mkDefault false;
    gdm.enable = lib.mkDefault true;
    fonts.enable = lib.mkDefault true;
    other.enable = lib.mkDefault true;

}
