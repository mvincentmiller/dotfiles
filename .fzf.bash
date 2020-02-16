# Setup fzf
# ---------
if [[ ! "$PATH" == */home/mvm/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/mvm/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/mvm/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/mvm/.fzf/shell/key-bindings.bash"
