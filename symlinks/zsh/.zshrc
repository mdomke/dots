zmodload zsh/zprof

ZGEN_PREZTO_REPO=sorin-ionescu/prezto

source "${HOME}/.dots/zgen/zgen.zsh"

if ! zgen saved;
then
  zgen prezto '*:*' case-sensitive no
  zgen prezto '*:*' color yes
  zgen prezto editor key-bindings vi
  zgen prezto prompt theme lambda
  zgen prezto ssh-agent forwarding yes
  zgen prezto ssh load identities figo id_rsa

  zgen prezto
  zgen prezto git
  zgen prezto editor
  zgen prezto ssh
  zgen prezto gpg
  zgen prezto fasd
  zgen prezto python
  zgen prezto history-substring-search
  zgen prezto syntax-highlighting

  zgen load "${HOME}/.zsettings"
  zgen load "${HOME}/.zthemes"
  zgen load "${HOME}/.dots/symlinks/zsh/completion"

  zgen load wfxr/forgit
  zgen save
fi

for file (${HOME}/.dots/symlinks/zsh/overwrite/*.zsh) source $file

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/mc mc
