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

            terminal = "alacritty";

            escapeTime = 0;

            extraConfig = ''
                bind -n M-C-L next-window
                bind -n M-C-H previous-window
                bind -T copy-mode-vi v send -X begin-selection
                bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel
                bind -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel
                bind '"' split-window -v -c "#{pane_current_path}"
                bind % split-window -h -c "#{pane_current_path}"
                '';

            plugins = with pkgs; [
                tmuxPlugins.vim-tmux-navigator
            ];

            keyMode = "vi";
        };
    };
}
