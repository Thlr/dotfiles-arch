#!/bin/sh

# see /etc/lightdm/Xsession for what is sourced at startup

feh --bg-fill $HOME/dotfiles/wallpapers/wood-light-road-dawn.jpg &
picom -b --experimental-backends --blur-method dual_kawase --backend glx --blur-strength 3 -r 16 &
xss-lock --transfer-sleep-lock -- sessionlock &
lorri daemon &
dunst &
sh -c "$HOME/.local/bin/remaps" &
dwmblocks &

synclient PalmDetect=1

(
# Wait for dwm to start before launching the applets
sleep 2 &
udiskie --tray &
megasync &
blueman-applet &
nm-applet &
) &

exec dwm
