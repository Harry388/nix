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

        shell = "${pkgs.zsh}/bin/zsh";

        escapeTime = 0;

        extraConfig = ''
            set -ag terminal-overrides ",alacritty:RGB"
            bind -T copy-mode-vi v send -X begin-selection
            bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel
            bind -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel
            bind -n C-M-h select-window -t -1
            bind -n C-M-l select-window -t +1
            bind -n C-1 select-window -t 1
            bind -n C-2 select-window -t 2
            bind -n C-3 select-window -t 3
            bind -n C-4 select-window -t 4
            bind -n C-5 select-window -t 5
            bind -n C-6 select-window -t 6
            bind -n C-7 select-window -t 7
            bind -n C-8 select-window -t 8
            bind -n C-9 select-window -t 9
            bind -n C-0 select-window -t 0
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
