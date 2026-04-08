#!/usr/bin/python

from pathlib import Path
from sys import argv

home_configs = {
    ".gitconfig": "~/.gitconfig",
    ".xinitrc": "~/.xinitrc",
    ".zshrc": "~/.zshrc",
    ".gtkrc-2.0": "~/.gtkrc-2.0",
    ".tmux.conf": "~/.tmux.conf",
    ".p10k.zsh": "~/.p10k.zsh",
    "dunst": "~/.config/dunst",
    "yamllint": "~/.config/yamllint",
    "gpg-agent.conf": "~/.gnupg/gpg-agent.conf",
    "gtk-3.0": "~/.config/gtk-3.0",
    "gtk-4.0": "~/.config/gtk-4.0",
    "htop": "~/.config/htop",
    "i3": "~/.config/i3",
    "nvim": "~/.config/nvim",
    "picom": "~/.config/picom",
    "polybar": "~/.config/polybar",
    "alacritty": "~/.config/alacritty",
    "zathura": "~/.config/zathura",
    "feh": "~/.config/feh",
    "rofi": "~/.config/rofi",
    "qt5ct": "~/.config/qt5ct",
    "mpv": "~/.config/mpv",
    "layout.service": "~/.config/systemd/user/layout.service",
    "ssh/config": "~/.ssh/config",
}

server_part = [
    ".zshrc",
    ".tmux.conf",
    ".p10k.zsh",
    "nvim",
    "htop",
    "yamllint",
]

server_option = len(argv) > 1 and argv[1] == "--server"
configs = (
    {config: home_configs[config] for config in server_part}
    if server_option
    else home_configs
)


for config, dest in configs.items():
    source = Path.cwd() / config
    target = Path(dest).expanduser()

    if not source.exists():
        print(f"missing source: {source}")
        continue

    if target.is_symlink() or target.is_file():
        target.unlink()
    elif target.is_dir():
        print(f"[WARN] remove directory manually: {target}")
        continue

    target.parent.mkdir(parents=True, exist_ok=True)
    target.symlink_to(source)
    print(f"installed: {target}")
