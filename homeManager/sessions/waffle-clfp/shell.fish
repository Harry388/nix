set name "$argv[1]"

if test -z "$SESSIONS_HOME"
    set SESSIONS_HOME "$HOME/.local/sessions"
end

if test -d "$SESSIONS_HOME/$name/scripts"
    fish_add_path -P "$SESSIONS_HOME/$name/scripts"
end

set TOKEN (grep SUPER_API_TOKEN < .env | cut -d = -f2 | tr -d '"')

alias curl 'curl -s -H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json"'
