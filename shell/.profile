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

export BROWSER=firefox
export EDITOR=nvim
export TERMINAL=st

# cargo binaries
export PATH="$HOME/.cargo/bin":$PATH
if [ -e /home/thlr/.nix-profile/etc/profile.d/nix.sh ]; then . /home/thlr/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
