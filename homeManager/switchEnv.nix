{ util, pkgs, ... }@confInps: util.mkModule {
    inherit confInps;
    name = "switchEnv";
} {

    home.packages = with pkgs; [
        (writeShellScriptBin "switch-env" (builtins.readFile ./scripts/switch-env))
    ];

}

