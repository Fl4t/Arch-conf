#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
# ...or the Window Manager of your choice

# disable CapsLock & map to Escape
# setxkbmap -option caps:escape &

# Kill X
setxkbmap -option terminate:ctrl_alt_bksp

# Numpad enabled
numlockx

# Wallpaper
nitrogen --restore &

#URxvt daemon
urxvtd -q -f -o

# Pour COMPIZ
#exec ck-launch-session start-compiz.sh

# Pour Pekwm
#exec ck-launch-session pekwm

# Pour DWM
# Dzen & conky
#(sleep 3s && exec ~/.conky/dwm/conky_start_dwm.sh | dzen2 -x '950' -e '' -fg '#737373' -bg '#262626' -w '490' -h '14' -ta r -fn '-*-fixed-medium-r-*-*-12-*-*-*-*-*-iso8859-*' -p ) &
# Start dwm
#exec ck-launch-session ~/scripts/dwm-start

# Pour WMFS
exec ck-launch-session ~/scripts/wmfs-start
