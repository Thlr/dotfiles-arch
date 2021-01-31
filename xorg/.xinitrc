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

feh --bg-scale $HOME/dotfiles/wallpapers/jrogers_11.webp &
picom -b &
xss-lock --transfer-sleep-lock -- sessionlock &
blueman-applet &
lorri daemon &
megasync &
udiskie --tray &
dunst &
sh -c "$HOME/.local/bin/remaps" &

dwm 2> ~/.dwm.log
