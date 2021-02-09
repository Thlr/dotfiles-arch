#!/bin/sh

# see /etc/lightdm/Xsession for what is sourced at startup

feh --bg-fill $HOME/dotfiles/wallpapers/forest.jpg &
picom -b --experimental-backends --blur-method dual_kawase --backend glx --blur-strength 3 &
xss-lock --transfer-sleep-lock -- sessionlock &
lorri daemon &
dunst &
sh -c "$HOME/.local/bin/remaps" &
dwmblocks &

(
# Wait for dwm to start before launching the applets
sleep 2 &
udiskie --tray &
megasync &
blueman-applet &
#nm-applet &
) &

exec dwm
