#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
# ...or the Window Manager of your choice

numlockx
#setxkbmap -option terminate:ctrl_alt_bksp
nitrogen --restore &

#exec ck-launch-session start-compiz.sh 
exec ck-launch-session pekwm
