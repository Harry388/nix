{ lib, config, pkgs, ... }:

let
    cfg = config.tmux;
in
{
    options.tmux = {
        enable = lib.mkEnableOption "enables tmux";
    };

    config = lib.mkIf cfg.enable {
        programs.tmux = {
            enable = true;

            baseIndex = 1;

            mouse = true;

            prefix = "C-space";

            terminal = "xterm-256color";

            escapeTime = 0;

            extraConfig = ''
                bind -n C-M-H previous-window
                bind -n C-M-L next-window
                '';

            plugins = with pkgs; [
                tmuxPlugins.vim-tmux-navigator
                tmuxPlugins.catppuccin
            ];
        };
    };
}
