export VIRTUAL_ENV_DISABLE_PROMPT=1
export VENV_HOME="${HOME}/.virtualenvs"

venv() {
  local -r cmd="$1"
  local venv_name
  local venv_path

  case "${cmd}" in
    ls)
      shift 1
      _list_venvs
      ;;
    rm)
      shift 1
      venv_name="$(_get_venv_name "$1")"
      venv_path="$(_get_venv_path "${venv_name}")"
      _delete_venv "${venv_name}" "${venv_path}"
      ;;
    help)
      _help
      ;;
    *)
      venv_name="$(_get_venv_name "$1")"
      venv_path="$(_get_venv_path "${venv_name}")"
      _create_venv "${venv_name}" "${venv_path}" "$2"
      ;;
  esac
}

_help() {
  cat << EOF
Usage:
  venv [<name>]
  venv ls
  venv rm <name>

Description:
  By default the command will create or activate a virtualenv. If <name> is not
  given it will be deduced from the current dir name.

  The ls command prefixs the curretly active environment with an asterisk.
EOF
}

_list_venvs() {
  for venv_path in "${VENV_HOME}"/*; do
    if [[ "${venv_path}" == "${VIRTUAL_ENV}" ]]; then
      prefix="*"
    else
      prefix=" "
    fi
    name="$(basename "${venv_path}")"
    printf "%s %-20s -> %s\n" "${prefix}" "${name}" "$("${venv_path}"/bin/python --version)"
  done
}

_create_venv() {
  local -r venv_name="$1"
  local -r venv_path="$2"

  if [[ -d "${venv_path}" ]]; then
    echo "Activating virtualenv '${venv_name}'"
    . "${venv_path}"/bin/activate
    return 0
  fi

  local python_bin="$(which python)"
  if [[ ! -x "${python_bin}" ]]; then
    echo "Python is not installed."
    return 1
  fi

  if [[ ! -d "${venv_path}" ]]; then
    echo "Creating virtualenv '${venv_name}' with $(${python_bin} --version)..."
    "${python_bin}" -m venv "${venv_path}"
  fi

  . "${venv_path}"/bin/activate
}

_delete_venv() {
  local -r venv_name="$1"
  local -r venv_path="$2"

  if [[ ! -d "${venv_path}" ]]; then
    echo "Virtualenv '${venv_name}' does not exist."
    return 1
  fi
  if [[ "${venv_path}" == "${VIRTUAL_ENV}" ]]; then
    deactivate
  fi
  echo "Deleting virtualenv '${venv_name}'"
  rm -rf "${venv_path}"
}

_get_venv_name() {
  local venv_name

  if [[ -z "$1" ]]; then
    venv_name="$(basename "${PWD}" | tr . -)"
  else
    venv_name="$1"
  fi
  echo "${venv_name}"
}

_get_venv_path() {
  echo "${HOME}/.virtualenvs/$1"
}
