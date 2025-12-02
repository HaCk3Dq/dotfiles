import dbus

BT_ICON = "%{T3}%{T-}"
LOW_BAT = 15
RED_COLOR = "%{F#FF4444}"
RESET_COLOR = "%{F-}"


def main() -> None:
    bus = dbus.SystemBus()
    manager = dbus.Interface(
        bus.get_object("org.bluez", "/"), "org.freedesktop.DBus.ObjectManager"
    )

    for _, interface in manager.GetManagedObjects().items():
        if "org.bluez.Battery1" not in interface:
            continue

        perc = int(interface["org.bluez.Battery1"].get("Percentage", -1))

        if perc >= 0:
            perc_text = f"{perc:2d}%"

            if perc <= LOW_BAT:
                perc_text = f"{RED_COLOR}{perc_text}{RESET_COLOR}"

            print(f"{BT_ICON} {perc_text}")
            exit()

    print("")


if __name__ == "__main__":
    main()
