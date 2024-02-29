# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/dima/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/Users/dima/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/dima/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/dima/.fzf/shell/key-bindings.zsh"
