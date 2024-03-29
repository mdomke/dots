# Use Ctrl-x,Ctrl-l to get the output of the last command
zmodload -i zsh/parameter
insert-last-command-output() {
  LBUFFER+="$(eval $history[$((HISTCMD-1))])"
}
zle -N insert-last-command-output
bindkey "^X^L" insert-last-command-output

# emacs style
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

# autosuggest
bindkey '^k' autosuggest-accept
