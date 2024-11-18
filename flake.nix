{
    description = "Nixos config flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        lime-3ds-nixpkgs.url = "github:nixos/nixpkgs/999b0e7a38606abd48d461c8225509740b886011";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        nixvim = {
            url = "github:nix-community/nixvim";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

        hyprland-plugins = {
            url = "github:hyprwm/hyprland-plugins";
            inputs.hyprland.follows = "hyprland";
        };
    };

    outputs = { self, nixpkgs, ... }@inputs: 
    let
        util = import ./util.nix { inherit inputs; };
    in
    with util; {
        nixosConfigurations = {
            laptop = mkSystem "laptop";
            desktop = mkSystem "desktop";
        };
    };
}
