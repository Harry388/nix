set -U fish_greeting

set -x FZF_DEFAULT_OPTS '
  --color=fg:#d0d0d0,fg+:#d0d0d0
  --color=hl:#6db760,hl+:#ff9c5e,info:#afaf87,marker:#6db760
  --color=prompt:#cd9bff,spinner:#ff48ad,pointer:#cd9bff,header:#87afaf
  --color=border:#262626,label:#aeaeae,query:#d9d9d9
  --prompt="> " --marker=">" --pointer="◆" --separator="─" --scrollbar="│"'

set -x LESS "-R"

set -x EDITOR "nvim"

fish_add_path "$HOME/.local/scripts"

bind ctrl-f find-session
bind ctrl-space accept-autosuggestion

set -x STARSHIP_CONFIG "$HOME/.config/starship/starship.toml"

alias clear "clear -x"
alias sail "sh $([ -f sail ] && echo sail || echo vendor/bin/sail)"
alias git-nuke "git reset --hard HEAD && git clean -fd"
alias git-auto-commit "git add -A && git commit -m"
alias git-log-pretty "git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'"

zoxide init fish | source
starship init fish | source

if test -z "$TMUX"
    session "$HOME"
end
