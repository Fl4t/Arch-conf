#!/bin/sh
source $HOME/.config/wmfs/global.conf
exec $CONKYCMD > $FICHIER 2> /dev/null &
xcompmgr -CcFf -t-5 -l-5 -r4.2 -o.55 &
wmfs
