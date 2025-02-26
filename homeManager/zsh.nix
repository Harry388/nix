{ util, pkgs, ... }@confInps: util.mkModule {
    inherit confInps;
    name = "zsh";
} {

    home.packages = with pkgs; [
        (writeShellScriptBin "switch" (builtins.readFile ./scripts/switch.sh))
        (writeShellScriptBin "switch-env" (builtins.readFile ./scripts/switch-env.sh))
        (writeShellScriptBin "session" (builtins.readFile ./scripts/session.sh))
        (writeShellScriptBin "firefox-fuzzel" (builtins.readFile ./scripts/firefox-fuzzel.sh))
    ];

    programs.zsh = {
        enable = true;
        enableCompletion = true;

        initExtra = ''
            bindkey -s "^F" 'session^M'
        '';

        shellAliases = {
            sail = "sh $([ -f sail ] && echo sail || echo vendor/bin/sail)";
        };

        oh-my-zsh = {
            enable = true;
            theme = "robbyrussell";
            plugins = [ # List of plugins: https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins
                "z" # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/z
            ];
        };

        history = {
            share = true; # false -> every terminal has it's own history
            size = 9999999; # Number of history lines to keep.
            save = 9999999; # Number of history lines to save.
            ignoreDups = true; # Do not enter command lines into the history list if they are duplicates of the previous event.
            extended = true; # Save timestamp into the history file.
        };
    };

}
