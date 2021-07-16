scrot /tmp/screen.png
convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png
[[ -f $1 ]] && convert /tmp/screen.png $1 -gravity center -composite -matte /tmp/screen.png
i3lock --time-pos="x+110:h-90" --date-pos="x+110:h-65" --time-color="ffffffff" --date-color="ffffffff" -k -u -e -i /tmp/screen.png
rm /tmp/screen.png
