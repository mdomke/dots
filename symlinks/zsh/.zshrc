zmodload zsh/zprof

fpath=("${HOME}/.zthemes" ${fpath})

source "${HOME}/.dots/zgen/zgen.zsh"

if ! zgen saved;
then
  zgen prezto '*:*' case-sensitive 'no'
  zgen prezto '*:*' color 'yes'
  zgen prezto editor key-bindings 'vi'
  zgen prezto prompt theme 'lambda'
  zgen prezto gpg-agent ssh-support 'yes'
  zgen prezto ssh-agent forwarding 'yes'

  zgen load Tarrasch/zsh-autoenv

  zgen prezto
  zgen prezto git
  zgen prezto ssh
  zgen prezto gpg
  zgen prezto fasd
  zgen prezto homebrew
  zgen prezto python
  zgen prezto history-substring-search
  zgen prezto syntax-highlighting

  zgen load "${HOME}/.zsettings"

  zgen save
fi

for file (${HOME}/.dots/symlinks/zsh/overwrite/*.zsh) source $file

# added by travis gem
[ -f /Users/mdomke/.travis/travis.sh ] && source /Users/mdomke/.travis/travis.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
