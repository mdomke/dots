# Makes git auto completion faster favouring for local completions
__git_files () {
    _wanted files expl 'local files' _files
}

# Don't try to glob with zsh so you can do stuff like ga *foo* and correctly have
# git add the right stuff
alias git='noglob git'


# forgit https://github.com/wfxr/forgit
forgit_log=fgl
forgit_diff=fgd
forgit_add=fga
forgit_ignore=fgi
forgit_restore=fgr
forgit_clean=fgc
forgit_stash_show=fgs
