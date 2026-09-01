inputs: { pkgs, ... }:

{

    environment.systemPackages = with pkgs; [
        (writeShellScriptBin "dots" (builtins.readFile ../../environment/scripts/dots))
    ];

}
