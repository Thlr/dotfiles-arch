#!/usr/bin/env bash

apps="dunst git kitty nix nvim p10k ranger rofi zathura zsh tmux x11 picom scripts shell fonts"

OPTS="--no-folding --verbose=1"

for app in $apps
do
    stow $OPTS $app
done
