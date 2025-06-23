{ util, pkgs, inputs, ... }@confInps: util.mkModule {
    inherit confInps;
    name = "gaming";
} {

    home.packages = with pkgs; [
        vesktop
        prismlauncher
        dolphin-emu
        modrinth-app
        clonehero
    ] ++ (with inputs.dated19dec-nixpkgs.legacyPackages.${pkgs.system}; [
        lime3ds
    ]);

}
