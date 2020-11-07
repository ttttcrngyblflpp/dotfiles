#!/bin/bash
xrdb ~/.Xresources

setxkbmap -device $(xinput list --id-only 'AT Translated Set 2 keyboard') -layout dvorak -option ctrl:swapcaps -option altwin:swap_lalt_lwin

#xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

exec i3
