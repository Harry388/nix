{ util, pkgs, ... }@confInps: util.mkModule {
    inherit confInps;
    name = "scripts";
} {

    home.packages = with pkgs; [
        (writeShellScriptBin "switch" (builtins.readFile ./scripts/switch.sh))
        (writeShellScriptBin "switch-env" (builtins.readFile ./scripts/switch-env.sh))
        (writeShellScriptBin "session" (builtins.readFile ./scripts/session.sh))
        (writeShellScriptBin "firefox-fuzzel" (builtins.readFile ./scripts/firefox-fuzzel.sh))
    ];

}
