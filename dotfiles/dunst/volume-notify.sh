#!/bin/sh

SINK=@DEFAULT_AUDIO_SINK@

VOL=$(wpctl get-volume $SINK | awk '{print $2}')

# si viene vacío, fallback
[ -z "$VOL" ] && VOL=0

VOL_INT=$(echo "$VOL * 100" | bc | cut -d'.' -f1)

dunstify -r 9999 -t 800 -h int:value:"$VOL_INT" "Volumen"
