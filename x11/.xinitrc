#!/bin/sh

# see /etc/lightdm/Xsession for what is sourced at startup

# Systray. These are launched here because if they load up before dwm (which is
# the case in .xprofile, some won't appear in the systreay)
udiskie --tray &
megasync &
blueman-applet &

exec dwm 2> ~/.dwm.log
