alias ls='/usr/bin/ls-icons --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='/usr/bin/ls-icons -lah --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='/usr/bin/ls-icons -ah --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
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
alias tmux='TERM=screen-256color tmux'

alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gcl='git clone --recurse-submodules'
alias gp='git push origin'
alias gf='git fetch'
alias gm='git merge --squash'
alias gpl='git pull --rebase origin'
alias gd='git diff'
alias gr='git rm'
alias gl='git lg'
alias deploy='git push heroku master'

alias S='sudo pacman -S'
alias Sc='echo "\n" | sudo pacman -Sc'
alias Ss='yay -Ss'
alias Syu='yay -Syu'
alias Syua='yay'
alias Q='yay -Q'
alias R='sudo pacman -R'
alias Rs='sudo pacman -Rs'
alias Rsc='sudo pacman -Rsc'
alias aS='yay -S --noconfirm'
alias aSs='yay -Ss'
