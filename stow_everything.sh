#!/usr/bin/env bash

# Do not include stow in that list. It is loaded beforehand anyways
apps="compton dunst git i3 kitty nvim p10k polybar ranger rofi wpg zsh redshift zathura"

OPTS=$@

stow $OPTS stow
for app in $apps
do
    stow $OPTS $app
done
