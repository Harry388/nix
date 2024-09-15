{ inputs }:

let 
    util = import ./util.nix { inherit inputs; };
in
{
    mkSystem = host: inputs.nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs util; };
        modules = [
            ./hosts/${host}/configuration.nix
            ./modules/default.nix
            inputs.home-manager.nixosModules.default
        ];
    };

    mkModule = { confInps, imports ? [], name }: module: {

        inherit imports;

        options.${name} = {
            enable = confInps.lib.mkEnableOption name;
        };

        config = confInps.lib.mkIf confInps.config.${name}.enable module;

    };
}
