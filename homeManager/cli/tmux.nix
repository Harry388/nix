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
                bind -T copy-mode-vi v send -X begin-selection
                bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel
                bind -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel
                '';

            plugins = with pkgs; [
                tmuxPlugins.vim-tmux-navigator
            ];

            keyMode = "vi";
        };
    };
}
