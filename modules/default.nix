{ util, lib, ... }@confInps: util.mkModule { 
    inherit confInps;
    name = "defaultModules";
    imports = [
        ./desktops/default.nix
        ./apps/default.nix
        ./smallGnome.nix
        ./fonts.nix
        ./base.nix
        ./openssh.nix
        ./tailscale.nix
        ./tlp.nix
    ];
} {

    defaultDesktop.enable = lib.mkDefault true;
    defaultApps.enable = lib.mkDefault true;
    smallGnome.enable = lib.mkDefault true;
    fonts.enable = lib.mkDefault true;
    base.enable = lib.mkDefault true;
    openssh.enable = lib.mkDefault false;
    tailscale.enable = lib.mkDefault true;
    tlp.enable = lib.mkDefault false;
}
