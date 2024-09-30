#!/bin/bash
sleep 3
wmctrl -l | awk '{print $1}' | while read -r win; do
	wmctrl -i -r "$win" -b remove,demands_attention
done
