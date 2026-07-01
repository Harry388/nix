inputs:

inputs.nixpkgs.lib.nixosSystem {
    modules = [
        ./configuration.nix
        ./hardware-configuration.nix
    ];
    specialArgs = {
        inherit inputs;
        self = inputs.self;
    };
}
