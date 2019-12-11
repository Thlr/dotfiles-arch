# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
CODESTATS_API_KEY="SFMyNTY.VkdobGIyeHkjI016WTROZz09.G5HVXCuZwY3G0lw-AHTmHOhLt6kylmRgGvLOONWA7Xo"

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


source ~/.aliases

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

export ANDROID_HOME=$HOME"/Android/Sdk"
export PATH=$PATH:$ANDROID_HOME"/emulator"
export PATH=$PATH:$ANDROID_HOME"/tools"
export PATH=$PATH:$ANDROID_HOME"/tools/bin"
export PATH=$PATH:$ANDROID_HOME"/platform-tools"
export PATH=$PATH:$ANDROID_HOME"/build-tools"

# Geckodriver for firefox web driver
export PATH=$PATH:"/usr/local/share/gecko_driver/geckodriver"

export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"

# PATH variables for texlive
TEXLIVE_HOME="/usr/local/texlive/2019"
export MANPATH=$MANPATH:$TEXLIVE_HOME"/texmf-dist/doc/man"
export INFOPATH=$INFOPATH:$TEXLIVE_HOME"/texmf-dist/doc/info"
export PATH="/usr/local/texlive/2019/bin/x86_64-linux":$PATH

# Custom prompt based on https://code.tutsplus.com/tutorials/how-to-customize-your-command-prompt--net-24083
function get_pwd() {
  echo "${PWD/$HOME/~}"
}

#ZSH_THEME_GIT_PROMPT_PREFIX="[git:"
#ZSH_THEME_GIT_PROMPT_SUFFIX="]$reset_color"
#ZSH_THEME_GIT_PROMPT_DIRTY="$fg[red]+"
#ZSH_THEME_GIT_PROMPT_CLEAN="$fg[green]"
#
#function current_branch() {
#    git rev-parse --abbrev-ref HEAD
#}
#
#function git_prompt_info() {
#  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
#  echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX "
#}
#
#PROMPT='${fg[cyan]}%m:${fg[yellow]}$(get_pwd)
#$(git_prompt_info)%{${reset_color}%}→ '

ZSH_THEME=powerlevel10k/powerlevel10k
