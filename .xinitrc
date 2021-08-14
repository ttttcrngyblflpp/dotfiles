#!/bin/bash
xrdb ~/.Xresources

setxkbmap -device $(xinput list --id-only 'AT Translated Set 2 keyboard') -layout dvorak -option ctrl:swapcaps -option altwin:swap_lalt_lwin

#xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --output DP-4 --primary --mode 5120x1440 --output DP-2 --off

dunst &

xset s off
xset dpms 3600 3600 3600
xset r rate 130 100

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi
exec i3
