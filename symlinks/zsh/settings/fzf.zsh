# Setup fzf
# ---------

export FZF_COMPLETION_TRIGGER='##'
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_DEFAULT_OPTS='--height 40% --reverse --inline-info'
export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"

if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="$PATH:/usr/local/opt/fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == */usr/local/opt/fzf/man* && -d "/usr/local/opt/fzf/man" ]]; then
  export MANPATH="$MANPATH:/usr/local/opt/fzf/man"
fi

# Auto-completion
# ---------------

_fzf_compgen_path() {
  ag -g "" "$1"
}

[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null
