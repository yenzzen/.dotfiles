#!/bin/bash

case $1 in
    up)   brightnessctl set 5%+ ;;
    down) brightnessctl set 5%- ;;
esac

PERCENT=$(brightnessctl -m | cut -d, -f4 | tr -d %)

ICON=" "

dunstify -r 2594 " " "$ICON $PERCENT%" -h int:value:"$PERCENT"
