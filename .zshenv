typeset -U PATH path
path=("$HOME/.local/bin" "$HOME/.local/bin/scripts" "$path[@]")

export CONFIGDIR="$HOME/.config"
export ZDOTDIR="$CONFIGDIR/zsh"

# env for applications
export EDITOR="nvim"
export BROWSER="firefox"
export TERM="foot"

# Golang
export GOPATH="$HOME/go"
export PATH=$PATH:"$GOPATH/bin"

# flutter
export PATH=$PATH:"$HOME/.local/src/flutter/bin"

# android sdk
export ANDROID_SDK_ROOT="$HOME/.local/bin/android-sdk"
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools/
export PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin/
export PATH=$PATH:$ANDROID_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/

# Locale settings
export LC_ALL="en_GB.utf8" 
. "$HOME/.cargo/env"
