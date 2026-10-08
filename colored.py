from os import environ
from subprocess import run

ENV_COLORS = {
    "home": "#223E55",
    "dev": "#192436",
    "test": "#282c34",
    "prod": "#331C1F",
}

env, pane, tmux = map(environ.get, ("SERVER_ENV", "TMUX_PANE", "TMUX"))
if env and pane and tmux:
    run(
        ["tmux", "select-pane", "-t", pane, "-P", f"bg={ENV_COLORS[env]}"],
        check=False,
    )
