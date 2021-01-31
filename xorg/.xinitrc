#!/bin/sh

# xprofile and other files are run by lightdm (/etc/lightdm/Xsession)

sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

while true; do
    dwm 2> ~/.dwm.log
done
