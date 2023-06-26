export FZF_COMPLETION_TRIGGER='##'
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_OPTS='--height 40% --reverse --inline-info --preview-window="right:hidden" --preview "[[ $(file --mime {}) =~ binary ]] && hexyl {} || bat -n --color always {}" --bind="?:toggle-preview"'
export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

FZF_ROOT="$(brew --prefix)/opt/fzf"

# Setup fzf
# ---------
if [[ ! "$PATH" == *${FZF_ROOT}/bin* ]]; then
  export PATH="${PATH:+${PATH}:}${FZF_ROOT}/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "${FZF_ROOT}/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "${FZF_ROOT}/shell/key-bindings.zsh"
