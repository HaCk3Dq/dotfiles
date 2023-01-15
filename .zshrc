if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    exec startx
fi

ZSH=/usr/share/oh-my-zsh/
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="true"

plugins=(
    adb
    ansible
    sudo
    sublime-merge
    colored-man-pages
    docker
    docker-compose
    pip
    ripgrep
    systemd
    virtualenvwrapper
)

export EDITOR="nvim"
export BAT_THEME="Nord"
export QT_QPA_PLATFORMTHEME="qt5ct"

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
    mkdir $ZSH_CACHE_DIR
fi

source ~/dotfiles/aliases.zsh
source $ZSH/oh-my-zsh.sh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

[[ -f ~/.SERVER_ENV ]] && source ~/.SERVER_ENV
python ~/dotfiles/colored.py

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform
