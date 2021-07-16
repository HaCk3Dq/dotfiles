#!/usr/bin/python
from os import system


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

for config, path in config_destinations.items():
    system(f'rm {path}{config}')
    system(f'ln -s $PWD/{config} {path}{config}')
    print(f'installed: {path}{config}')

system('rm -r ~/.config/sublime-text-3/Packages/User')
system('ln -s $PWD/sublime/User ~/.config/sublime-text-3/Packages/User')
print('installed: subltime-text user configs')
