if g:colors_name != 'apprentice'
  finish
endif

hi ColorColumn guibg=#1c1c1c ctermbg=234

au VimEnter * so ~/.config/nvim/settings/apprentice.vim
