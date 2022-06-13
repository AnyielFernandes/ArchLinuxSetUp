#!/bin/bash 

if [ $# -ne 1 ]; then 
    echo "Usage: $0 [+|-]volume-level%"
fi

CURRENT_SINK=$(pactl list sinks | awk '{ if ($1 == "Destino") { num = substr($2,2,1) } else if ($2 == "RUNNING") { print num } }')

if [ ${CURRENT_sinl} = "0" ]; then
    amixer -q sset 'Master' $1
else
    pactl set-sink-volume ${CURRENT_SINK} $1
fi

