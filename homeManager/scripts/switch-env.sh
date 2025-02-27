if [ -z "$XDG_CONFIG_HOME" ]; then
    XDG_CONFIG_HOME="$HOME/.config"
fi

if [ -z "$MY_CONFIG" ]; then
    MY_CONFIG="$HOME/nix/homeManager/config"
fi

move () {
    dir="$1"
    to="$2"
    rm -rf "$to"
    cp -R "$dir" "$to"
}

move_config () {
    move "$MY_CONFIG/$1" "$XDG_CONFIG_HOME/$1"
}

move_config "ghostty"
move_config "tmux"
move_config "git"
move_config "btop"
move_config "waybar"
move_config "fuzzel"
move_config "yazi"
