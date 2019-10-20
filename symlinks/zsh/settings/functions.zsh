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

sail() {
  kubectl config use-context $1
}

kxi() {
	local pod=$(kubectl get pods | fzf | awk '{print $1}')
	local containers=$(kubectl get pods "${pod}" -o jsonpath='{.spec.containers[*].name}')
	local container=${containers}
	if [[ $containers =~ ' ' ]]; then
		container=$(echo "${containers}" | tr ' ' '\n' | fzf)
	fi
	echo "${pod}" - "${container}"
	kubectl exec -it "${pod}" -c "${container}" -- "${@}"
}

kli() {
	local pod=$(kubectl get pods | fzf | awk '{print $1}')
	local containers=$(kubectl get pods "${pod}" -o jsonpath='{.spec.containers[*].name}')
	local container=${containers}
	if [[ $containers =~ ' ' ]]; then
		container=$(echo "${containers}" | tr ' ' '\n' | fzf)
	fi
	echo "${pod}" - "${container}"
	kubectl logs "${@}" "${pod}" -c "${container}"
}

klfi() {
	kli -f --tail=10
}

kdi() {
	local typ=${1:-"pods"}
	local item=$(kubectl get "${typ}" | fzf | awk '{print $1}')
	kubectl describe "${typ}" "${item}"
}

kcni() {
	local ns=$(kubectl get namespace | fzf | awk '{print $1}')
	local current=$(kubectl config current-context)
	kubectl config set-context "${current}" --namespace="${ns}"
}

kclean() {
  local ns=$(kubectl get sa default -o jsonpath='{.metadata.namespace}')
  kubectl -n $ns delete deploy,statefulset,configmap,svc,etcd,jobs,po,pvc --all
}
