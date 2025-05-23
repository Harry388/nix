set -U fish_greeting

set -x FZF_DEFAULT_OPTS '
  --color=fg:#d0d0d0,fg+:#d0d0d0
  --color=hl:#6db760,hl+:#ff9c5e,info:#afaf87,marker:#6db760
  --color=prompt:#cd9bff,spinner:#ff48ad,pointer:#cd9bff,header:#87afaf
  --color=border:#262626,label:#aeaeae,query:#d9d9d9
  --prompt="> " --marker=">" --pointer="◆" --separator="─" --scrollbar="│"'

set -x LESS "-R"

fish_add_path "$HOME/.local/scripts"

bind ctrl-f session
bind ctrl-space accept-autosuggestion

set -x STARSHIP_CONFIG "$HOME/.config/starship/starship.toml"

alias cd "z"
alias cat "bat"
alias clear "clear -x"
alias sail "sh $([ -f sail ] && echo sail || echo vendor/bin/sail)"
alias ahoj "sail artisan"
alias nuke "git reset --hard HEAD && git clean -fd"
alias gs "git status"
alias gd "git diff"
alias ga "git add -A"
alias gc "git commit -m"
alias ac "ga && gc"
alias gp "git pull"
alias gP "git push"
alias gf "git fetch"
alias gb "git branch"
alias gba "git branch -a"
alias gk "git checkout"
alias gfs "git fetch && git status"
alias gr "git restore"
alias gl "git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'"
alias gla "gl --all"

zoxide init fish | source
starship init fish | source
