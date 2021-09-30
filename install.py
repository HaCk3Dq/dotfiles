#!/usr/bin/python
from os import system
from sys import argv


config_destinations = {
    '.gitconfig': '~/',
    '.xinitrc': '~/',
    '.zshrc': '~/',
    '.gtkrc-2.0': '~/',
    '.tmux.conf': '~/',
    '.p10k.zsh': '~/',
    'dunst': '~/.config/',
    'dunst': '~/.config/',
    'gtk-3.0': '~/.config/',
    'htop': '~/.config/',
    'i3': '~/.config/',
    'nvim': '~/.config/',
    'picom': '~/.config/',
    'polybar': '~/.config/',
    'alacritty': '~/.config/',
    'zathura': '~/.config/',
    'feh': '~/.config/',
    'layout.service': '~/.config/systemd/user/',
}

server_part = [
    '.zshrc',
    '.tmux.conf',
    '.p10k.zsh',
    'nvim',
]

for config, path in config_destinations.items():
    if len(argv) > 1 and argv[1] == '--server' and config not in server_part:
        continue

    system(f'rm {path}{config}')
    system(f'ln -s $PWD/{config} {path}{config}')
    print(f'installed: {path}{config}')

