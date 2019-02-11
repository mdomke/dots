# Create a dated file
mkdf() {
  touch "$(date +'%Y-%m-%d')_$@"
}


# Cleanup latex helper files
texclean() {
  rm -f ./*.{aux,log}
}

ifip() {
  ifconfig $1 | awk '/inet /{print$2}'
}

cryptpw() {
  python -c "import bcrypt; print bcrypt.hashpw('$1', bcrypt.gensalt())"
}


tun() {
  if [[ $# < 2 || $# > 3 ]]
  then
    echo "Usage: tun <host> <hostport> [<port>]"
    return 1
  fi
  local host="$1"
  local hostport="$2"
  local port=${3:-$hostport}
  ssh -L ${port}:localhost:${hostport} ${host}
}

calculate-path () {
  hash=$(echo -n $1 | md5)
  first=${hash:30:2}
  second=${hash:28:2}
  vault="$1.sqlcipher"
  dst_path="/data/vaults/$first/$second/$vault"
  echo $dst_path
}

1p() {
  eval $(op signin my)
}

klogin() {
  if ! 1p; then
    return
  fi
  kubelogin --username martin.domke --password $(op get item --vault=dgcaxagtabbehm5oriwx27mk5i 4fjrrokpx5fydowek2z2ap6pme | jq -r '.details.fields[] | select(.designation=="password").value')
}
