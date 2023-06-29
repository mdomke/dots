source <(fasd --init zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install)

fasd_cd() {
	local fasd_ret="$(fasd -d "$@")"
	if [[ -d "$fasd_ret" ]]
	then
		cd "$fasd_ret"
	else
		print "$fasd_ret"
	fi
}

alias z="fasd_cd -d"
alias zz="fasd_cd -d -i"
