{ inputs, util, lib, ... }:

{

    home-manager = {
        extraSpecialArgs = { inherit inputs util; };
        users.harry = util.mkUser "harry" {

            defaultHome.enable = true;

            defaultHomeDesktop.enable = false;
            gaming.enable = false;
            apps.enable = false;
            programs.google-chrome.enable = false;

            home.stateVersion = "23.11"; # Don't change
        };
    };

    boot.loader.grub.enable = false;
    boot.loader.generic-extlinux-compatible.enable = true;

    defaultModules.enable = true;

    defaultDesktop.enable = false;
    defaultApps.enable = false;
    hardware.graphics.enable = lib.mkForce false;

    services.getty.autologinUser = "harry";

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "24.11"; # Did you read the comment?

}
