alias ls='eza --icons -g --group-directories-first'
alias tree='exa --icons --tree --group-directories-first'
alias cp='cp -i'
alias df='df -h'
alias free='free -hm'
alias diff='diff --color=auto'
alias grep='rg'
alias uptime='uptime -p'
alias cat='bat'
alias rm='rm -rf'
alias feh='feh -q --scale-down --auto-zoom'
alias ping='mtr'
alias less='less -r'
alias v='nvim'
vr() {
    nvim --server ${XDG_RUNTIME_DIR:-${TMPDIR}nvim.${USER}}/nvim.*.0 --remote-tab-silent "$(realpath "$1")"
}
alias ip='ip -color=auto'
alias lg='lazygit'
alias ldo='lazydocker'

alias dswd='docker stack deploy -c docker-compose.yml'
alias dswr='docker stack rm'
alias dswl='docker service ls'
alias db='docker build'

alias gs='git status --short --branch'
alias ga='git add'
alias gc='git commit -m'
alias gco='git checkout'
alias gcob='fzf-git-checkout'
alias gcl='git clone --recurse-submodules'
alias gp='git push'
alias gf='git fetch'
alias gm='git merge'
alias gpl='git pull'
alias gd='git diff'
alias gr='git rm'
alias gl='git lg'
alias gb='git branch -avv --list'
alias gbd='git branch -D'

fzf-git-branch() {
    git rev-parse HEAD > /dev/null 2>&1 || return

    git branch --color=always --all --sort=-committerdate |
    grep -v HEAD |
    fzf --height 50% --ansi --no-multi --preview-window right:65% \
        --preview 'git log -n 50 --color=always --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed "s/.* //" <<< {})' |
    sed "s/.* //"
}
fzf-git-checkout() {
    git rev-parse HEAD > /dev/null 2>&1 || return
    local branch

    branch=$(fzf-git-branch)
    if [[ "$branch" = "" ]]; then
        echo "No branch selected."
        return
    fi

    if [[ "$branch" = 'remotes/'* ]]; then
        git checkout --track $branch
    else
        git checkout $branch;
    fi
}

alias S='sudo pacman -S'
alias Sc='echo "\n" | sudo pacman -Sc'
alias Ss='yay -Ss'
alias Syu='yay -Syu'
alias Syua='yay'
alias Q='yay -Q'
alias R='sudo pacman -R'
alias F='sudo pacman -F'
alias Rs='sudo pacman -Rs'
alias Rsc='sudo pacman -Rsc'
alias aS='yay -S --noconfirm'
alias aSs='yay -Ss'
