# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

export LC_ALL=en_US.UTF-8
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Shell theme
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

#
# User configuration
#

autoload -U compinit; compinit
# indlude zsh-completions
# need to be installed with `brew  zsh-completions` command
# if type brew &>/dev/null; then
#   FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

#   autoload -Uz compinit
#   compinit
# fi

# ASDF
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/dmitrijsvecov/TempProjects/aws_serverless_try/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/dmitrijsvecov/TempProjects/aws_serverless_try/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/dmitrijsvecov/TempProjects/aws_serverless_try/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/dmitrijsvecov/TempProjects/aws_serverless_try/node_modules/tabtab/.completions/sls.zsh

# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/dmitrijsvecov/.npm/_npx/97826/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/dmitrijsvecov/.npm/_npx/97826/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh

# export MANPATH="/usr/local/man:$MANPATH"

# export LESS="-X"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

#
# Bindings ZSH and ZLE
# custom bindings are made to mimic readline/bash experience
# more info https://zsh.sourceforge.io/Doc/Release/Zsh-Line-Editor.html
#
# ^ char - control key
# ^[ seq - option key

bindkey '^A' beginning-of-line
# CRTL + right-arrow
bindkey '^[[1;5C' end-of-line
bindkey '^E' end-of-line
# CRTL + left-arrow
bindkey '^[[1;5D' beginning-of-line
bindkey '^K' kill-line
bindkey '^A' beginning-of-line
bindkey '^W' backward-kill-word
bindkey '^[d' delete-word
bindkey '^U' kill-whole-line
# OPT + right-arrow
bindkey '^[[1;3C' forward-word
bindkey '^[f' forward-word
# OPT + left-arrow
bindkey '^[[1;3D' backward-word
bindkey '^[b' backward-word

# Enable CRTL+x CRTL+e combination to continue editing line in the $EDITOR
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

#
# fzf configuration
# make sure it is installed with homebrew `brew install fzf`
#
export FZF_DEFAULT_COMMAND='fd --type f --hidden'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#
# Atuin configuration
# make sure it is installed with homebrew `brew install atuin`
# https://docs.atuin.sh/
#
# must be after `fzf` configuration to keep CTRL-R keybing for Atuin
#

eval "$(atuin init zsh)"

export PATH=$PATH:~/Projects/personal/git-scripts
export PATH=$PATH:~/Projects/personal/utils
export PATH=$PATH:~/bin
# Postgres libql & client
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

export PATH="/usr/local/opt/solana/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/libpq/lib"
export CPPFLAGS="-I/usr/local/opt/libpq/include"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#
# Shell extensions
#

function open_command() {
  local open_cmd
  # define the open command
  case "$OSTYPE" in
    darwin*)  open_cmd='open' ;;
    cygwin*)  open_cmd='cygstart' ;;
    linux*)   [[ "$(uname -r)" != *icrosoft* ]] && open_cmd='nohup xdg-open' || {
                open_cmd='cmd.exe /c start ""'
                [[ -e "$1" ]] && { 1="$(wslpath -w "${1:a}")" || return 1 }
              } ;;
    msys*)    open_cmd='start ""' ;;
    *)        echo "Platform $OSTYPE not supported"
              return 1
              ;;
  esac
  ${=open_cmd} "$@" &>/dev/null
}

# Open the node api for your current version to the optional section.
function nodejsdocs {
  local section=${1:-all}
  open_command "https://nodejs.org/docs/$(node --version)/api/$section.html"
}
