HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

setopt autocd extendedglob nomatch notify correctall promptsubst
unsetopt appendhistory beep
autoload -U colors compinit
colors 
compinit

[[ -a $(whence -p pacman-color) ]] && compdef _pacman pacman-color=pacman

eval $(dircolors ~/.dircolors)
autoload -U pick-web-browser
alias -s {go,txt,cfg,c,cpp,rb,asm,nim}=subl3
alias -s {avi,mpeg,mpg,mov,m2v}=mplayer
alias -s {html,htm}=chromium
alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -lh --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -lha --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias cp="cp -i"
alias df='df -h'
alias nvidia='optirun -b primus'
alias unlock='sudo rm /var/lib/pacman/db.lck'
alias free='free -m'
alias grep='grep --colour=auto'
alias nimc='nim c --verbosity:0'
alias nimcr='nim c -r --verbosity:0 -d:release --opt:speed'
alias nimi='nim i'
alias q='exit'
alias extensions='nautilus -w ~/.local/share/gnome-shell/extensions/; q'

bindkey '\e[3~' delete-char  # del
bindkey ';5D' backward-word  # ctrl+left
bindkey ';5C' forward-word   # ctrl+right

# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

typeset -A key
key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}
[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        printf '%s' "${terminfo[smkx]}"
    }
    function zle-line-finish () {
        printf '%s' "${terminfo[rmkx]}"
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi

export GOPATH=/home/hacked/go
local gitprompt='$(~/dotfiles/gitprompt.py)'
export PROMPT="%{$fg_bold[blue]%}% %~${gitprompt} %{$fg[white]%}% $ %{$reset_color%}%u"