#!/bin/bash

muted=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q MUTED && echo 1 || echo 0)

if [[ "$muted" -eq 1 ]]; then
  wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
else
  wpctl set-mute @DEFAULT_AUDIO_SINK@ 1
fi
