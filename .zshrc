if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    exec startx
fi

ZSH=/usr/share/oh-my-zsh/
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="true"
zstyle :omz:plugins:ssh-agent quiet yes

plugins=(
    ssh-agent
    ansible
    sudo
    colored-man-pages
    docker
    docker-compose
    pip
    systemd
    virtualenvwrapper
    kubectl
    kubectx
    helm
)

export EDITOR="nvim"
export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git" '
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
eval "$(uv generate-shell-completion zsh)"
