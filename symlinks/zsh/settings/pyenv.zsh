export PYENV_VIRTUALENV_DISABLE_PROMPT=1
if which pyenv > /dev/null;
then
  eval "$(pyenv init -)"
  # The precmd hook seems to be very slow, disable it for now.
  if which pyenv-virtualenv-init > /dev/null;
  then
    eval "$(pyenv virtualenv-init -)";
  fi
fi
