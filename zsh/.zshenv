export KUBECONFIG=$HOME/.kube/config

# Go debugging tool
export PATH="$HOME/go/bin/":$PATH

# PATH variables for texlive
TEXLIVE_HOME="/usr/local/texlive/2020"
export MANPATH=$MANPATH:$TEXLIVE_HOME"/texmf-dist/doc/man"
export INFOPATH=$INFOPATH:$TEXLIVE_HOME"/texmf-dist/doc/info"
export PATH="/usr/local/texlive/2020/bin/x86_64-linux":$PATH

if [ -e /home/thlr/.nix-profile/etc/profile.d/nix.sh ]; then . /home/thlr/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

export RYAX_MAIN_DIR=$HOME/work/ryax/ryax-main

export NIX_PATH="ryaxpkgs=$HOME/work/ryax/ryax-main/ryaxpkgs/:ryaxuserpkgs=$HOME/work/ryax/ryax-main/ryaxuserpkgs:$NIX_PATH"

export PATH="/home/thlr/.pyenv/bin:$PATH"

export PATH="$HOME/.poetry/bin:$PATH"
