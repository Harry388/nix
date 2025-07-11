{ util, lib, ... }@confInps: util.mkModule { 
    inherit confInps;
    name = "defaultHomePkgs";
    imports = [
        ./apps.nix
        ./languages.nix
        ./tools.nix
        ./gaming.nix
    ];
} {

    apps.enable = lib.mkDefault true;
    languages.enable = lib.mkDefault true;
    tools.enable = lib.mkDefault true;
    gaming.enable = lib.mkDefault true;

}
