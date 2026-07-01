inputs:

inputs.nixpkgs.lib.nixosSystem {
    modules = [
        (import ./configuration.nix inputs)
        ./hardware-configuration.nix
    ];
}
