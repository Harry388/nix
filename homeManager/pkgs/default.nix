{ util, lib, ... }@confInps: util.mkModule { 
    inherit confInps;
    name = "defaultHomePkgs";
    imports = [
        ./apps.nix
        ./languages.nix
        ./tools.nix
        ./gaming.nix
        ./essential.nix
    ];
} {

    apps.enable = lib.mkDefault true;
    languages.enable = lib.mkDefault true;
    tools.enable = lib.mkDefault true;
    gaming.enable = lib.mkDefault true;
    essential.enable = lib.mkDefault true;

}
