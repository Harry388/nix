{ util, pkgs, ... }@confInps: util.mkModule { 
    inherit confInps;
    name = "tmux";
} {

    programs.tmux = {
        enable = true;

        baseIndex = 1;

        mouse = true;

        prefix = "C-a";

        terminal = "tmux-256color";

        shell = "${pkgs.zsh}/bin/zsh";

        escapeTime = 0;

        extraConfig = ''
            bind -T copy-mode-vi v send -X begin-selection
            bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel
            bind -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel
            bind -n C-M-h select-window -t -1
            bind -n C-M-l select-window -t +1
            bind -n M-1 select-window -t 1
            bind -n M-2 select-window -t 2
            bind -n M-3 select-window -t 3
            bind -n M-4 select-window -t 4
            bind -n M-5 select-window -t 5
            bind -n M-6 select-window -t 6
            bind -n M-7 select-window -t 7
            bind -n M-8 select-window -t 8
            bind -n M-9 select-window -t 9
            bind -n M-0 select-window -t 0
            bind v split-window -h -c "#{pane_current_path}"
            bind h select-pane -L
            bind j select-pane -D
            bind k select-pane -U
            bind l select-pane -R
            set -g status-style bg=default
            set -g status-fg white
            '';

        keyMode = "vi";
    };

}
