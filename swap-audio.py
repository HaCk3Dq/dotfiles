#!/usr/bin/python
import pulsectl

headphones = 'alsa_output.usb-Macronix_Razer_Barracuda_X_2.4_1234-00.analog-stereo'
speakers = 'alsa_output.pci-0000_00_1f.3.analog-stereo'

with pulsectl.Pulse('sink-swapper') as pulse:
    sink_list = pulse.sink_list()
    if headphones in [e.name for e in sink_list]:
        swapped = speakers if pulse.server_info()\
            .default_sink_name == headphones else headphones
        found_sink = list(filter(lambda e: e.name == swapped, sink_list))
        if found_sink:
            pulse.default_set(found_sink[0])
