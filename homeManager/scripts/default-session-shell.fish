set name "$argv[1]"

if test -z "$SESSIONS_HOME"
    set SESSIONS_HOME "$HOME/.local/sessions"
end

if test -d "$SESSIONS_HOME/$name/scripts"
    fish_add_path -P "$SESSIONS_HOME/$name/scripts"
end
