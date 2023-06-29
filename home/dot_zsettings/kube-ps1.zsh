export KUBE_PS1_SYMBOL_ENABLE=false
export KUBE_PS1_PREFIX=''
export KUBE_PS1_SUFFIX=''

get_cluster_short() {
  echo "$1" | sd "fcloud-|-(oncall|default|shared)" ""
}

export KUBE_PS1_CLUSTER_FUNCTION=get_cluster_short
