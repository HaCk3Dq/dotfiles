import i3ipc
from subprocess import run, PIPE

xkb_path = '/home/hacked/dotfiles/xkblayout-state'
bind = {
    'us': ['Alacritty', 'firefox', 'Org.gnome.Nautilus', 'Spotify', 'Tor Browser'],
    'ru': ['TelegramDesktop', 'discord']
}
bind['all'] = bind['us'] + bind['ru']


def swap_layout(current):
    bit = '1' if current == 'us' else '0'
    run([xkb_path, 'set', bit])


def swap(focused, layout):
    if focused in bind['all'] and focused not in bind[layout]:
        swap_layout(layout)


def get_layout():
    out = run([xkb_path, 'print', '"%c"'], stdout=PIPE).stdout
    return 'us' if out.decode("utf-8") == '"0"' else 'ru'


def on_window_focus(i3, _):
    focused = i3.get_tree().find_focused().window_class
    swap(focused, get_layout())


i3 = i3ipc.Connection(auto_reconnect=True)
i3.on("window::focus", on_window_focus)
i3.main()
