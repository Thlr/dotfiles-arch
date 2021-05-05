# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ZSH_THEME=powerlevel10k/powerlevel10k

# plugins=(git)

source "${HOME}/.zgen/zgen.zsh"

# if the init script doesn't exist
if ! zgen saved; then

  # specify plugins here
  zgen oh-my-zsh
  zgen load romkatv/powerlevel10k powerlevel10k
  zgen load zsh-users/zsh-syntax-highlighting
#  zgen load zsh-users/zsh-autosuggestions

  # generate the init script from plugins above
  zgen save
fi

[ -f ~/.aliasrc ] && source ~/.aliasrc

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# kubectl and minikube autocompletion
source <(kubectl completion zsh)

# nix related packages
#source ~/.nix-profile/etc/profile.d/nix.sh

# nice ls colors
source "/home/thlr/.local/share/lscolors.sh"

# To customize prompt, run `p10k configure` or edit ~/dotfiles/p10k/.p10k.zsh.
[[ ! -f ~/dotfiles/p10k/.p10k.zsh ]] || source ~/dotfiles/p10k/.p10k.zsh

# lorri shell hook
eval "$(direnv hook zsh)"

# created by poetry for autocompletion
autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc

set -o vi
# This binding needs to be re-set with vi mode
bindkey "^R" history-incremental-search-backward

eval "$(pyenv init -)"
