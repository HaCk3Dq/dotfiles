from os import system, environ


env = environ.get('SERVER_ENV')

env_colors = {
    'home': '#223E55',
    'dev': '#192436',
    'test': '#282c34',
    'prod': '#331C1F',
    None: 'default',
}

system(f'tmux select-pane -P "bg={env_colors[env]}"')
