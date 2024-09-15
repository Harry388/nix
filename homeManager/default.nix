{ util, lib, ... }@confInps: util.mkModule { 
    inherit confInps;
    name = "defaultHome";
    imports = [
        ./cli/default.nix
        ./pkgs/default.nix
        ./desktops/default.nix
    ];
} {

    programs.google-chrome.enable = lib.mkDefault true;
    defaultHomeCli.enable = lib.mkDefault true;
    defaultHomePkgs.enable = lib.mkDefault true;
    defaultHomeDesktop.enable = lib.mkDefault true;

}
