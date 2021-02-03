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

# snap
export PATH="/var/lib/snapd/snap/bin/":$PATH

# Custom scripts
export PATH="$HOME/.local/bin/":$PATH
export PATH="$HOME/.local/bin/statusbar":$PATH

export NIX_PATH=ryaxpkgs=$RYAX_MAIN_DIR/ryaxpkgs:ryaxuserpkgs=$RYAX_MAIN_DIR/user-pkgs:$NIX_PATH

export BROWSER=firefox
export EDITOR=nvim
export TERMINAL=st

# cargo binaries
export PATH="$HOME/.cargo/bin":$PATH
