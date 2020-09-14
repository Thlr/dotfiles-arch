export PATH=$HOME/bin:/usr/local/bin:$PATH

CODESTATS_API_KEY="SFMyNTY.VkdobGIyeHkjI016WTROZz09.G5HVXCuZwY3G0lw-AHTmHOhLt6kylmRgGvLOONWA7Xo"
ZSH_THEME=powerlevel10k/powerlevel10k

source "${HOME}/.zgen/zgen.zsh"

# if the init script doesn't exist
if ! zgen saved; then

  # specify plugins here
  zgen oh-my-zsh
  zgen load https://gitlab.com/code-stats/code-stats-zsh.git
  zgen load romkatv/powerlevel10k powerlevel10k

  # generate the init script from plugins above
  zgen save
fi

###########
# ALIASES #
###########

# enable color support of ls and also add handy aliases
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -l'

alias gl='cd ~/cours/2A/Projet_GL'

alias gistats='~/.local/share/gitstats/gitstats'

alias vpn='/opt/cisco/anyconnect/bin/vpn'
alias vpnui='/opt/cisco/anyconnect/bin/vpnui'

alias avalanche='cd ~/cours/2A/projet-file/avalancheModeling'

alias whats='cd ~/work/qapa/whatsapp'

alias vim='nvim'

# added by Anaconda3 2018.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/home/theo/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/home/theo/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/theo/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/home/theo/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
conda deactivate

###########
# EXPORTS #
###########

# Android sdk related exports
export ANDROID_HOME=$HOME"/Android/Sdk"
export PATH=$PATH:$ANDROID_HOME"/emulator"
export PATH=$PATH:$ANDROID_HOME"/tools"
export PATH=$PATH:$ANDROID_HOME"/tools/bin"
export PATH=$PATH:$ANDROID_HOME"/platform-tools"
export PATH=$PATH:$ANDROID_HOME"/build-tools"

export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"

# PATH variables for texlive
TEXLIVE_HOME="/usr/local/texlive/2020"
export MANPATH=$MANPATH:$TEXLIVE_HOME"/texmf-dist/doc/man"
export INFOPATH=$INFOPATH:$TEXLIVE_HOME"/texmf-dist/doc/info"
export PATH="/usr/local/texlive/2020/bin/x86_64-linux":$PATH

# Rider IDE
export PATH="$HOME/.local/share/JetBrains/Toolbox/apps/JetBrains Rider-2019.3/bin/":$PATH

# uuuh
export PATH="$HOME/.local/share/minecraft-launcher/":$PATH

# snap
export PATH="/var/lib/snapd/snap/bin/":$PATH

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# kubectl and minikube autocompletion
source <(kubectl completion zsh)
source <(minikube completion zsh)

# nix related packages
source ~/.nix-profile/etc/profile.d/nix.sh

# fzf useful commands
fda() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}

#Go debugging tool
export PATH="/home/theo/go/bin/":$PATH

# kubernetes aliases
alias kctl=kubectl
