#!/usr/bin/python
from sys import argv
from subprocess import run, PIPE
from os import system


def get_output(cmd: list) -> str:
    return run(cmd, stdout=PIPE).stdout.decode().rstrip()


current_cmd = get_output(['tmux', 'display', '-p', '#{pane_current_command}'])

# vim:tmux
commands = {
    'new_split': (
        'send-keys "C-F2"',
        'split-window -h -c "#{pane_current_path}"'
    ),
    'move_left': (
        'send-keys "S-left"',
        'select-pane -L'
    ),
    'move_right': (
        'send-keys "S-right"',
        'select-pane -R'
    )
}

cmd = commands[argv[1]][current_cmd != 'nvim']
system(f'tmux {cmd}')
