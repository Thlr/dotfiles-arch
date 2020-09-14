#!/usr/bin/env bash

# Do not include stow in that list. It is loaded beforehand anyways
apps="dunst git kitty nix nvim p10k ranger rofi zathura zsh tmux xorg"

OPTS="--no-folding --verbose=1"

stow $OPTS stow
for app in $apps
do
    stow $OPTS $app
done
