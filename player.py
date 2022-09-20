from sys import argv
from os import system
from subprocess import run, PIPE
from itertools import cycle, islice

STATUS_MAP = {
    'loop': ['None', 'Track', 'Playlist'],
    'shuffle': ['On', 'Off'],
}


def get_status(cmd: str) -> str:
    return run(['playerctl', '-p', 'spotify', cmd], stdout=PIPE).stdout.decode().rstrip()


def send_cmd(cmd: str, status: str = '') -> None:
    system(f'playerctl -p spotify {cmd} {status}')


def send_notify(text: str) -> None:
    system(f'notify-send "{text}"')


match argv:
    case [_, ('play' | 'pause')]:
        send_cmd('play-pause')
    case [_, ('previous' | 'next') as direction]:
        send_cmd(direction)
    case [_, ('loop' | 'shuffle') as cmd]:
        status = get_status(cmd)
        status_list = STATUS_MAP[cmd]
        next_status = next(
            islice(cycle(status_list), status_list.index(status) + 1, None))
        send_cmd(cmd, next_status)
        send_notify(f'{cmd.title()}: {next_status}')
