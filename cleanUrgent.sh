#!/bin/bash
sleep 2
for win in $(wmctrl -l | awk -F' ' '{print $1}'); do
	wmctrl -i -r "$win" -b remove,demands_attention
done
