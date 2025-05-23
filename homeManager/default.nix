{ util, lib, ... }@confInps: util.mkModule {
    inherit confInps;
    name = "defaultHome";
    imports = [
        ./pkgs/default.nix
        ./desktops/default.nix
        ./zsh.nix
        ./syncthing.nix
        ./switchEnv.nix
    ];
} {

    defaultHomePkgs.enable = lib.mkDefault true;
    defaultHomeDesktop.enable = lib.mkDefault true;

    programs.google-chrome.enable = lib.mkDefault true;
    syncthing.enable = lib.mkDefault true;
    zsh.enable = lib.mkDefault false;
    switchEnv.enable = lib.mkDefault true;

}
