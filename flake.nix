{
    description = "Nixos config flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        nixvim = {
            url = "github:nix-community/nixvim/2ef974182ef62a6a6992118f0beb54dce812ae9b";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

        hyprland-plugins = {
            url = "github:hyprwm/hyprland-plugins";
            inputs.hyprland.follows = "hyprland";
        };
    };

    outputs = { self, nixpkgs, ... }@inputs: {
        nixosConfigurations = {
            laptop = nixpkgs.lib.nixosSystem {
                specialArgs = { inherit inputs; };
                modules = [
                    ./hosts/laptop/configuration.nix
                    ./modules/default.nix
                    inputs.home-manager.nixosModules.default
                ];
            };
            desktop = nixpkgs.lib.nixosSystem {
                specialArgs = { inherit inputs; };
                modules = [
                    ./hosts/desktop/configuration.nix
                    ./modules/default.nix
                    inputs.home-manager.nixosModules.home-manager {
                        home-manager = {
                            extraSpecialArgs = { 
                                inherit inputs;
                                monitors = [
                                    "DVI-D-1, 1680x1050, 0x0, 1"
                                    "HDMI-A-1, 1920x1080, 1680x0, 1"
                                    "fake, 2000x1200, 0x1050, 2"
                                ];
                            };
                            users = {
                                "harry" = import ./home/harry.nix;
                            };
                        };
                    }
                ];
            };
        };
    };
}
