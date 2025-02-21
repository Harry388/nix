{ util, lib, ... }@confInps: util.mkModule { 
    inherit confInps;
    name = "defaultHomeCli";
    imports = [
        ./nixvim.nix
        ./zsh.nix
    ];
} {

    nixvim.enable = lib.mkDefault true;
    zsh.enable = lib.mkDefault true;

}
