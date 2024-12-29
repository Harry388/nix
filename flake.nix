{
    description = "Nixos config flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        dated19dec-nixpkgs.url = "github:nixos/nixpkgs/d70bd19e0a38ad4790d3913bf08fcbfc9eeca507";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        nixvim = {
            url = "github:nix-community/nixvim";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        ghostty = {
            url = "github:ghostty-org/ghostty";
        };
    };

    outputs = inputs:
    let
        util = import ./util.nix { inherit inputs; };
    in
    with util; {
        nixosConfigurations = {
            laptop = mkSystem "laptop";
            desktop = mkSystem "desktop";
        };
        homeConfigurations = {
            harry = mkHome "harry" {
                languages.enable = true;
                tools.enable = true;
                defaultHomeCli.enable = true;
                ghostty.enable = false;
                home.stateVersion = "24.11"; # Don't change
            };
        };
    };
}
