#!/usr/bin/env bash

apps="dunst git nix nvim p10k rofi zathura zsh x11 scripts shell fonts"

OPTS="--no-folding --verbose=1"

for app in $apps
do
    stow $OPTS $app
done
