#!/bin/sh

# swap ctrl and capslock, set esc to capslock when tapped
setxkbmap -option ctrl:nocaps && killall xcape 2>/dev/null ; xcape -e 'Control_L=Escape' &

# speed xrate up
xset r rate 300 50 &

# remove mouse when idle
unclutter &

# start compton
picom &

# set background
~/.fehbg &

# make screen warm
redshift -P -O 4000

# set hotkeys with sxhkd
sxhkd &

# merge Xresources
#xrdb -merge ~/.Xresources

# start i3
exec i3
