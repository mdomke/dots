" ========================================
" Vim plugin configuration
" ========================================

set rtp+=~/.config/nvim/plugins/

call plug#begin('~/.config/nvim/plugged')

Plug 'sheerun/vimrc'

runtime project.vim
runtime languages.vim
runtime git.vim
runtime search.vim
runtime textobjects.vim
runtime vim-improvements.vim
runtime appearance.vim

call plug#end()
