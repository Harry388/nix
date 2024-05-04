{ lib, config, ... }:

let
    cfg = config.zsh;
in
{
    options.zsh = {
        enable = lib.mkEnableOption "enables zsh";
    };

    config = lib.mkIf cfg.enable {
        programs.zsh = {
            enable = true;
            enableCompletion = true;

            shellAliases = {
                switch = "sudo nixos-rebuild switch --flake ~/nix";
                update = "nix flake update";
                krisp = "nix run \"github:steinerkelvin/dotfiles#discord-krisp-patch\"";
            };

            oh-my-zsh = {
                # 2023-07-28: oh-my-zsh doesn't have a plugin that shows me the exit code if it was not 0 (I'd probably have to define my own prompt)
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
    };
}
