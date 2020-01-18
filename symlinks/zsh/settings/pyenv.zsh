if command -v pyenv 1>/dev/null 2>&1; then
  source <(pyenv init -)
  source <(pyenv virtualenv-init -)
fi
