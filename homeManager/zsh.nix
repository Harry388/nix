{ util, pkgs, ... }@confInps: util.mkModule {
    inherit confInps;
    name = "zsh";
} {

    home.packages = with pkgs; [
        (writeShellScriptBin "switch-env" (builtins.readFile ./scripts/switch-env))
    ];

    programs.zsh = {
        enable = true;
        enableCompletion = true;

        initExtra = ''
            bindkey -s "^F" 'session^M'
            export FZF_DEFAULT_OPTS="
                --color=fg:#908caa,bg:#191724,hl:#ebbcba
                --color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba
                --color=border:#403d52,header:#31748f,gutter:#191724
                --color=spinner:#f6c177,info:#9ccfd8
                --color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa
            "
            eval "$(zoxide init zsh)"
            export PATH="$PATH:$HOME/.local/scripts"
        '';

        shellAliases = {
            sail = "sh $([ -f sail ] && echo sail || echo vendor/bin/sail)";
            san = "sail artisan";
            gs = "git status";
            gd = "git diff";
            ga = "git add -A";
            gc = "git commit -m";
            ac = "git commit -a -m";
            gp = "git pull";
            gP = "git push";
            gf = "git fetch";
        };

        oh-my-zsh = {
            enable = true;
            theme = "robbyrussell";
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
