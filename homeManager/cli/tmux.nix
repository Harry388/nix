{ util, pkgs, ... }@confInps: util.mkModule { 
    inherit confInps;
    name = "tmux";
} {

    programs.tmux = {
        enable = true;

        baseIndex = 1;

        mouse = true;

        prefix = "C-space";

        terminal = "tmux-256color";

        escapeTime = 0;

        extraConfig = ''
            set -ag terminal-overrides ",alacritty:RGB"
            bind L next-window
            bind H previous-window
            bind -T copy-mode-vi v send -X begin-selection
            bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel
            bind -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel
            bind '"' split-window -v -c "#{pane_current_path}"
            bind % split-window -h -c "#{pane_current_path}"
            set -g status-style bg=default
            set -g status-fg white
            '';

        plugins = with pkgs; [
            tmuxPlugins.vim-tmux-navigator
        ];

        keyMode = "vi";
    };

}
