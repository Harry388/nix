{ inputs }:

{
    mkSystem = host: inputs.nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
            ./hosts/${host}/configuration.nix
            ./modules/default.nix
            inputs.home-manager.nixosModules.default
        ];
    };
}
