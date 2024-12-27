profile=$(grep Name= < ~/.mozilla/firefox/profiles.ini  | awk -F= '{print $2}' | fuzzel --placeholder="Firefox Pofile" --background-color=000000FF --border-color=E66000FF --border-width=2 --text-color=FFFFFFFF --selection-color=331E54FF --selection-text-color=FFFFFFFF --prompt-color=FFFFFFFF --selection-match-color=E66000FF --dmenu)
if [ -n "$profile" ]; then
    firefox -P "$profile"
fi
