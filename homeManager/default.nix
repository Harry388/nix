{ util, lib, ... }@confInps: util.mkModule { 
    inherit confInps;
    name = "defaultHome";
    imports = [
        ./pkgs/default.nix
        ./desktops/default.nix
        ./scripts.nix
        ./nixvim.nix
    ];
} {

    programs.google-chrome.enable = lib.mkDefault true;
    defaultHomePkgs.enable = lib.mkDefault true;
    defaultHomeDesktop.enable = lib.mkDefault true;
    scripts.enable = lib.mkDefault true;
    nixvim.enable = lib.mkDefault true;

}
