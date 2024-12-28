dirs=(
    "$HOME" "$HOME/work" "$HOME/programming"
    "$HOME/programming/js" "$HOME/programming/zig" "$HOME/programming/rust"
    "$HOME/programming/gleam" "$HOME/programming/golang" "$HOME/programming/elixir"
)
dir=$(find "${dirs[@]}" -maxdepth 1 -mindepth 1 -type d ! -path "*/.*" 2> /dev/null | fzf)
if [ -n "$dir" ]; then
    name=$(basename "$dir")
    if ! tmux has-session -t "$name"; then
        tmux new-session -c "$dir" -s "$name" -d
        if [ -f "$dir/.session" ]; then
            tmux send-keys -t "$name" "source $dir/.session" c-M clear
        elif [ -f "$HOME/nix/homeManager/cli/scripts/.session" ]; then
            tmux send-keys -t "$name" "source $HOME/nix/homeManager/cli/scripts/.session" c-M clear
        fi
    fi
    if [ -n "$TMUX" ]; then
        tmux switch -t "$name"
    else
        tmux attach -t "$name"
    fi
fi
