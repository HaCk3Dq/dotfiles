from os import environ, system

env = environ.get("SERVER_ENV")

env_colors = {
    "home": "#223E55",
    "dev": "#192436",
    "test": "#282c34",
    "prod": "#331C1F",
    None: "default",
}

if environ.get("TMUX"):
    system(f'tmux select-pane -P "bg={env_colors[env]}"')
