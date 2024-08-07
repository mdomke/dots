# Aliases in this file are bash and zsh compatible

dots=$HOME/.dots

# Global aliases
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
# alias -g C='| wc -l'
alias -g H='| head'
alias -g L="| less"
alias -g N="| /dev/null"
alias -g S='| sort'
# alias -g G='| grep'
alias -g P='| pbcopy'

# Suffix aliases
extensions=(go rs js hs vim html css txt csv)
for ext in $extensions; do
  alias -s $ext=$EDITOR
done

# PS
alias psa="ps aux"
alias psg="ps aux | grep "

# show me files matching "ls grep"
alias lsg='ll | grep'

# Alias Editing
alias ae='$EDITOR ~/.zsettings/aliases.zsh' #alias edit
alias ar='source ~/.zsettings/aliases.zsh'  #alias reload

alias vim="nvim"
alias ve='vim ~/.config/nvim/init.vim'

# zsh profile editing
alias ze='$EDITOR ~/.zshrc'
alias zr='source ~/.zshrc'

# Git Aliases
alias gpl='git pull'
alias gcp='git cp'
alias gi='$EDITOR .gitignore'
alias guns='git unstage'
alias gunc='git uncommit'
alias gam='git amend --reset-author'
alias gtg='git tag -a -s'
alias gtg-min='git tag -a -s $(git-semver -target minor)'
alias gtg-maj='git tag -a -s $(git-semver -target major)'
alias gtg-pat='git tag -a -s $(git-semver -target patch)'
alias gtl='git tag -l -n1 | gsort -V'
alias gtv='git tag -v'
alias gpam='git push --tags && git push origin develop master'
alias gtm='git merge $(git tag | egrep "\d+\.\d+\.\d+" | gsort -rV | head -n1)'
alias gpu='git push -u origin $(git rev-parse --abbrev-ref HEAD)'

# Common shell functions
alias less='less -r'
alias tf='tail -f'
alias l='less'
alias lh='ls -alt | head' # see the last modified files
alias screen='TERM=screen screen'
alias cl='clear'

# Zippin
alias gz='tar -cvjf'
alias gx='tar -xvjf'

alias ka9='killall -9'
alias k9='kill -9'

# Forward port 80 to 3000
alias portforward='sudo ipfw add 1000 forward 127.0.0.1,3000 ip from any to any 80 in'

alias lsnet="lsof -nP -i4TCP -sTCP:LISTEN"

local grc="${HOMEBREW_PREFIX}/bin/grc -es --colour=auto"
alias ping="${grc} ping"
alias dig="${grc} dig"
alias ifconfig="${grc} ifconfig"
alias traceroute="${grc} traceroute"

# Python
alias repl="ipython"

# docker
alias dcp="docker-compose"
alias dma="docker-machine"
alias dsw="docker-swarm"
alias drm='docker rm -v $(docker ps -aq -f status=exited)'
alias drmi='docker rmi $(docker images -f "dangling=true" -q)'

alias lint="tox -e flake8 --"
alias q="tox -e quick --"

alias k="kubectl"
alias ka='kubectl apply -f'
alias kcu='kubectl config use-context'
alias kcl='kubectl config get-contexts'
alias kv='kubectl describe'
alias kg='kubectl get'
alias kga='kubectl get pods,services,deployments,statefulsets'
alias kgaw='watch -n1 -t kubectl get pods,services,deployments,statefulsets'
alias kgp='kubectl get pods'
alias kgs='kubectl get services'
alias kl='kubectl logs'
alias klf='kubectl logs -f --tail=10'
alias kpf='kubectl port-forward'
alias kx='kubectl exec -it'
alias kd='k delete'
alias kda='k delete statefulsets,deployment,jobs,cronjob,svc,etcd,configmap,rbac,po,etcd,pvc,serviceaccount,vaultsecret,mapping --all'

alias tp='telepresence --run zsh'

alias yq4='yq'
alias fire-in-da-hole='open /Applications/UrbanTerror/Quake3-UrT.app --args "+password fire" "+connect home.lad1337.com"'
