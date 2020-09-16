# Android sdk related exports
#export ANDROID_HOME=$HOME"/Android/Sdk"
#export PATH=$PATH:$ANDROID_HOME"/emulator"
#export PATH=$PATH:$ANDROID_HOME"/tools"
#export PATH=$PATH:$ANDROID_HOME"/tools/bin"
#export PATH=$PATH:$ANDROID_HOME"/platform-tools"
#export PATH=$PATH:$ANDROID_HOME"/build-tools"

#export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
#export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
#export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"

# PATH variables for texlive
TEXLIVE_HOME="/usr/local/texlive/2020"
export MANPATH=$MANPATH:$TEXLIVE_HOME"/texmf-dist/doc/man"
export INFOPATH=$INFOPATH:$TEXLIVE_HOME"/texmf-dist/doc/info"
export PATH="/usr/local/texlive/2020/bin/x86_64-linux":$PATH

# snap
export PATH="/var/lib/snapd/snap/bin/":$PATH

# Go debugging tool
export PATH="$HOME/go/bin/":$PATH

# Custom scripts
export PATH="$HOME/.local/bin/":$PATH
export PATH="$HOME/.local/bin/statusbar":$PATH

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
