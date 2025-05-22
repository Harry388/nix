set -U fish_greeting

set -x FZF_DEFAULT_OPTS "
    --color=fg:#908caa,bg:#191724,hl:#ebbcba
    --color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba
    --color=border:#403d52,header:#31748f,gutter:#191724
    --color=spinner:#f6c177,info:#9ccfd8
    --color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa
"

set -x LESS "-R"

fish_add_path "$HOME/.local/scripts"

bind ctrl-f session

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
alias gk "git checkout"
alias gfs "git fetch && git status"
alias gr "git restore"
alias gl "git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'"
alias gla "gl --all"

zoxide init fish | source
starship init fish | source
