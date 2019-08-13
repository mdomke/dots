# Aliases in this file are bash and zsh compatible

dots=$HOME/.dots

# Global aliases
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g C='| wc -l'
alias -g H='| head'
alias -g L="| less"
alias -g N="| /dev/null"
alias -g S='| sort'
alias -g G='| grep'
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
alias ae='vim ~/.zsettings/aliases.zsh' #alias edit
alias ar='source ~/.zsettings/aliases.zsh'  #alias reload

alias vim="nvim"
alias ve='vim ~/.config/nvim/init.vim'

# zsh profile editing
alias ze='vim ~/.zshrc'
alias zr='source ~/.zshrc'

# Git Aliases
alias gpl='git pull'
alias gcp='git cp'
alias gi='vim .gitignore'
alias guns='git unstage'
alias gunc='git uncommit'
alias gam='git amend --reset-author'
alias gtg='git tag -a -s'
alias gtl='git tag -l -n1 | gsort -V'
alias gtv='git tag -v'
alias gpam='git push --tags && git push origin develop master'
alias gtm='git merge $(git tag | egrep "\d+\.\d+\.\d+" | gsort -rV | head -n1)'

# Common shell functions
alias less='less -r'
alias tf='tail -f'
alias l='less'
alias lh='ls -alt | head' # see the last modified files
alias screen='TERM=screen screen'
alias cl='clear'
alias dog='pygmentize'

# Zippin
alias gz='tar -cvjf'
alias gx='tar -xvjf'

alias ka9='killall -9'
alias k9='kill -9'

# Forward port 80 to 3000
alias portforward='sudo ipfw add 1000 forward 127.0.0.1,3000 ip from any to any 80 in'

alias lsnet="lsof -nP -i4TCP -sTCP:LISTEN"

local grc="/usr/local/bin/grc -es --colour=auto"
alias ping="${grc} ping"
alias dig="${grc} dig"
alias ifconfig="${grc} ifconfig"
alias traceroute="${grc} traceroute"

# Python
alias py2="python2"
alias py3="python3"
alias py-build="python setup.py bdist_wheel"
alias repl="ipython"

# docker
alias dcp="docker-compose"
alias dma="docker-machine"
alias dsw="docker-swarm"
alias drm='docker rm -v $(docker ps -aq -f status=exited)'
alias drmi='docker rmi $(docker images -f "dangling=true" -q)'

alias ci="fly -t ci"
alias ap='pwd; echo "Continue?"; read; ansible-playbook --vault-password-file=~/.vault_pass.txt -i inventory --diff'
alias av='ansible-vault --vault-password-file=~/.vault_pass.txt'
alias apd='ap plays/fapi_deploy_to_host.yml'

alias lint="tox -e flake8 --"
alias t="tox -e py27 --"
alias q="tox -e quick --"

alias k="kubectl"
alias ka='kubectl apply -f'
alias kcc='kubectl config use-context'
alias kd='kubectl describe'
alias kg='kubectl get'
alias kga='kubectl get pods,services,deployments,statefulsets'
alias kgaw='watch -n1 -t kubectl get pods,services,deployments,statefulsets'
alias kgp='kubectl get pods'
alias kgs='kubectl get services'
alias kl='kubectl logs'
alias klf='kubectl logs -f --tail=10'
alias kpf='kubectl port-forward'
alias kx='kubectl exec -it'
