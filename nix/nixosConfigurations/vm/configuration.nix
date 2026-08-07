{ self, ... }: { lib, pkgs, modulesPath, ... }:

{

    networking.hostName = "vm";

    imports = [
        self.nixosModules.harryUser
        self.nixosModules.base
        self.nixosModules.openssh
        self.nixosModules.switchEnv
        self.nixosModules.tools
        (modulesPath + "/profiles/qemu-guest.nix")
    ];

    users.users.harry.initialPassword = "nixos";

    boot = {
        tmp.useTmpfs = true;
    };

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

    virtualisation.vmVariant = {
        virtualisation = {
            memorySize = 2048;
            cores = 2;
            graphics = false;
            forwardPorts = [
                { from = "host"; host.port = 2222; guest.port = 22; }
            ];
        };
    };

    networking.firewall.allowedTCPPorts = [ 22 ];

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "26.05"; # Did you read the comment?

}
