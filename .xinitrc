if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

/usr/bin/xcalib -d :0 /usr/share/color/icc/NV156FHM_N61.icm
dunst &
firefox &
alacritty -e tmux &
nvim-ui &
Telegram &
nautilus &
spotify &
# discord --start-minimized &
./.screenlayout/main.sh &
feh --no-fehbg --bg-scale Pictures/wallpaper.jpg &
picom &
slack -u &
upwork &
exec i3
