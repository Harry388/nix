dirs=(
    "$HOME" "$HOME/work" "$HOME/programming"
    "$HOME/programming/js" "$HOME/programming/zig" "$HOME/programming/rust" "$HOME/programming/gleam" "$HOME/programming/golang" "$HOME/programming/elixir"
)
dir=$(find "${dirs[@]}" -maxdepth 1 -mindepth 1 -type d ! -path "*/.*" 2> /dev/null | fzf)
if [[ -n $dir ]] then
    name=$(basename $dir)
    tmux has-session -t $name
    if [[ $? != 0 ]] then
        tmux new-session -c $dir -s $name -d
        tmux send-keys -t $name "source $dir/.session" c-M
    fi
    if [[ -n $TMUX ]] then
        tmux switch -t $name
    else
        tmux attach -t $name
    fi
fi
