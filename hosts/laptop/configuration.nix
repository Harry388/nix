{ inputs, util, ... }:

{

    home-manager = {
        extraSpecialArgs = { inherit inputs util; };
        users.harry = util.mkUser "harry" {

            defaultHome.enable = true;

            wayland.windowManager.hyprland.settings.monitor = [
                "eDP-1, 1920x1200, 0x0, 1"
                "HDMI-A-1, 1920x1080, 1920x0, 1"
            ];

            home.stateVersion = "23.11"; # Don't change
        };
    };

    boot.loader = {
        efi.canTouchEfiVariables = true;
        systemd-boot.enable = true;
    };

    defaultModules.enable = true;

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "23.05"; # Did you read the comment?

}
