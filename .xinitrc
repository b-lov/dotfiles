#!/bin/sh

# swap ctrl and capslock, set esc to capslock when tapped
# setxkbmap -option ctrl:nocaps && 
setxkbmap && killall xcape 2>/dev/null ; xcape -e 'Control_L=Escape'

xset r rate 300 50 & # speed xrate up

unclutter & # remove mouse when idle

picom & # start picom

/home/max/.config/.fehbg & # set background

redshift -P -O 4500 # make screen warm

exec bspwm # start bspwm
