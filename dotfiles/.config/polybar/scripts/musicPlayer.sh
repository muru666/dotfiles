#!/bin/bash

status=$(playerctl status 2>/dev/null)

if [[ -z "$status" ]]; then
    echo '  '
elif [[ "$status" == 'Playing' ]]; then
    echo '  '
else
    echo '  '
fi