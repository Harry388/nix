inputs: { pkgs, ... }:

{

    environment.systemPackages = with pkgs; [
        (writeShellScriptBin "switch-env" (builtins.readFile ../../environment/scripts/switch-env))
    ];

}
