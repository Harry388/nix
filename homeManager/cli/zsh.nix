{ util, pkgs, ... }@confInps: util.mkModule { 
    inherit confInps;
    name = "zsh";
} {

    home.packages = with pkgs; [
        (writeShellScriptBin "switch" ''
            current_generation=$(nixos-rebuild list-generations | grep current | awk '{print $1}')

            sudo nixos-rebuild switch --flake ~/nix

            new_generation=$(nixos-rebuild list-generations | grep current | awk '{print $1}')

            if [[ $current_generation != $new_generation ]] then
                git stage *
                git commit -m "$new_generation $1"
                echo "$new_generation: $1"
            else
                echo "$new_generation: No Change"
            fi
        '')
        (writeShellScriptBin "session" ''
            dir=$(find ~ ~/work ~/programming ~/programming/js ~/programming/zig ~/programming/rust ~/programming/gleam ~/programming/golang ~/programming/elixir -maxdepth 1 -type d ! -path "*/.*" | fzf)
            if [[ -n $dir ]] then
                tmux has-session -t $dir
                if [[ $? != 0 ]] then
                    tmux new-session -c $dir -s $dir -d
                fi
                if [[ -n $TMUX ]] then
                    tmux switch -t $dir
                else
                    tmux attach -t $dir
                fi
            fi
        '')
        (writeShellScriptBin "firefoxFuzzel" ''
            profile=$(cat ~/.mozilla/firefox/profiles.ini | grep Name= | awk -F= '{print $2}' | fuzzel --placeholder="Firefox Pofile" --background-color=000000FF --border-color=E66000FF --border-width=2 --text-color=FFFFFFFF --selection-color=331E54FF --selection-text-color=FFFFFFFF --prompt-color=FFFFFFFF --selection-match-color=E66000FF --dmenu)
            if [[ -n $profile ]] then
                firefox -P $profile
            fi
        '')
    ];

    programs.zsh = {
        enable = true;
        enableCompletion = true;

        initExtra = ''
            bindkey -s "^F" 'session^M'
        '';

        shellAliases = {
            generation = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system | grep current | awk '{print $1}'";
            sail = "sh $([ -f sail ] && echo sail || echo vendor/bin/sail)";
        };

        oh-my-zsh = {
            enable = true;
            theme = "gallifrey";
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
