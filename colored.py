from os import environ, system

env = environ.get("SERVER_ENV")

env_colors = {
    "home": "#223E55",
    "dev": "#192436",
    "test": "#282c34",
    "prod": "#331C1F",
    None: "default",
}

pane = environ.get("TMUX_PANE")
if environ.get("TMUX") and pane:
    system(f'tmux select-pane -t "{pane}" -P "bg={env_colors[env]}"')
