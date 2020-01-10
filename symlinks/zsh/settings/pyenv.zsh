export WORKON_HOME=${HOME}/.virtualenvs
export PROJECT_HOME=${HOME}/Source
source /usr/local/bin/virtualenvwrapper_lazy.sh

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
