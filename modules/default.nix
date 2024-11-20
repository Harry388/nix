{ util, lib, ... }@confInps: util.mkModule { 
    inherit confInps;
    name = "defaultModules";
    imports = [
        ./desktops/default.nix
        ./apps/default.nix
        ./nvidia.nix
        ./gdm.nix
        ./keyring.nix
    ];
} {

    defaultDesktop.enable = lib.mkDefault true;
    defaultApps.enable = lib.mkDefault true;
    nvidia.enable = lib.mkDefault false;
    gdm.enable = lib.mkDefault true;
    keyring.enable = lib.mkDefault true;
    services.gvfs.enable = true;

}
