#!/bin/sh

# see /etc/lightdm/Xsession for what is sourced at startup

feh --bg-scale $HOME/dotfiles/wallpapers/jrogers_11.webp &
picom -b --experimental-backends --blur-method dual_kawase --backend glx &
xss-lock --transfer-sleep-lock -- sessionlock &
lorri daemon &
dunst &
sh -c "$HOME/.local/bin/remaps" &
dwmblocks &

udiskie --tray &
megasync &
blueman-applet &

while true; do
  dwm 2> ~/.dwm.log
done
