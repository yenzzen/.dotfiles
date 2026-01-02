#!/bin/bash

case $1 in
    up)   wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+ ;;
    down) wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- ;;
    mute) wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle ;;
esac

STATUS=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)

VOLUME=$(echo "$STATUS" | awk '{print int($2 * 100)}')

IS_MUTED=$(echo "$STATUS" | grep "MUTED")

if [ -n "$IS_MUTED" ]; then
    ICON=" "
    BAR_VAL=0
else
    BAR_VAL=$VOLUME
    if [ "$VOLUME" -lt 30 ]; then
        ICON=" "
    elif [ "$VOLUME" -lt 70 ]; then
        ICON=" "
    else
        ICON=" "
    fi
fi

dunstify -r 2593 " " "$ICON $VOLUME%" -h int:value:"$BAR_VAL"
