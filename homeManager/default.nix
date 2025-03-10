{ util, lib, ... }@confInps: util.mkModule { 
    inherit confInps;
    name = "defaultHome";
    imports = [
        ./pkgs/default.nix
        ./desktops/default.nix
        ./zsh.nix
        ./nixvim.nix
        ./syncthing.nix
    ];
} {

    defaultHomePkgs.enable = lib.mkDefault true;
    defaultHomeDesktop.enable = lib.mkDefault true;

    programs.google-chrome.enable = lib.mkDefault true;
    syncthing.enable = lib.mkDefault true;
    zsh.enable = lib.mkDefault true;
    nixvim.enable = lib.mkDefault true;

}
