#!/usr/bin/python
from subprocess import run

import pulsectl

with pulsectl.Pulse("sink-swapper") as pulse:
    sinks = [s for s in pulse.sink_list() if "hdmi" not in s.name]
    current = pulse.server_info().default_sink_name  # type: ignore

    sink_names = [s.name for s in sinks]
    current_index = sink_names.index(current)
    next_index = (current_index + 1) % len(sinks)

    pulse.default_set(sinks[next_index])
    run(["notify-send", sinks[next_index].description])
