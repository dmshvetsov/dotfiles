export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export VISUAL=nvim
export EDITOR=$VISUAL
export GOPATH=$HOME/Projects/golang
source $HOME/.secrets
export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file
export RUST_WITHOUT=rust-docs           # do not install rust-docs which is very large and takes up to half of the size of installation
export RIPGREP_CONFIG_PATH=$HOME/.config/ripgrep/rgrc
