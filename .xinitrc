#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
# ...or the Window Manager of your choice

# VirtualBox Guest
/usr/bin/VBoxClient-all &

# disable CapsLock & map to Escape
# setxkbmap -option caps:escape &

# Kill X
setxkbmap -option terminate:ctrl_alt_bksp

# Numpad enabled
# numlockx &

# Wallpaper
nitrogen --restore &

#URxvt daemon
urxvtd -q -f -o

#MPD
#mpd /home/fl4t/.mpd/config

# Pour COMPIZ
#exec ck-launch-session compiz-start.sh

# Pour Pekwm
# exec ck-launch-session pekwm
# exec pekwm

# Pour WMFS
exec ck-launch-session wmfs-start.sh 

# Pour dwm
# exec dwm
