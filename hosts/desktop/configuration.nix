{ inputs, util, ... }:

{

    home-manager = {
        extraSpecialArgs = { inherit inputs util; };
        users.harry = util.mkUser "harry" {

            defaultHome.enable = true;

            wayland.windowManager.hyprland.settings = {
                monitor = [
                    "DVI-D-1, 1680x1050, 0x0, 1"
                    "HDMI-A-1, 1920x1080, 1680x0, 1"
                    "fake, 2000x1200@60.00, 0x1050, 2"
                ];

                env = [
                    "LIBVA_DRIVER_NAME,nvidia"
                    "__GLX_VENDOR_LIBRARY_NAME,nvidia"
                    "ELECTRON_OZONE_PLATFORM_HINT,auto"
                ];
            };

            home.stateVersion = "23.11"; # Don't change
        };
    };

    boot.loader = {
        efi.canTouchEfiVariables = true;
        systemd-boot.enable = true;
    };

    gnome.enable = true;

    defaultModules.enable = true;

    nvidia.enable = true;

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "23.05"; # Did you read the comment?

}
