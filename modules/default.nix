{ util, lib, ... }@confInps: util.mkModule { 
    inherit confInps;
    name = "defaultModules";
    imports = [
        ./desktops/default.nix
        ./apps/default.nix
        ./nvidia.nix
    ];
} {

    defaultDesktop.enable = lib.mkDefault true;
    defaultApps.enable = lib.mkDefault true;
    nvidia.enable = lib.mkDefault false;

}
