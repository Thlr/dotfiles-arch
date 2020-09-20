#!/usr/bin/env bash

apps="dunst git kitty nix nvim p10k ranger rofi zathura zsh tmux xorg picom scripts"

OPTS="--no-folding --verbose=1"

for app in $apps
do
    stow $OPTS $app
done
