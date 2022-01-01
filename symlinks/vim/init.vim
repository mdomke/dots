syntax on

let mapleader=","

" =============== Plugin initialization ===============
if filereadable(expand("~/.config/nvim/plugins.vim"))
  source ~/.config/nvim/plugins.vim
endif

" ================ General Config ====================
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set gcr=a:blinkon0              "Disable cursor blink

set timeout
set timeoutlen=500

" ================ Indentation ======================
set smartindent
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

set nowrap

set wildignore+=*vim/backups*
set wildignore+=*.png,*.jpg,*.gif
set completeopt=menuone

set scrolloff=8
set sidescrolloff=15
set sidescroll=1

set shortmess+=c
set signcolumn=yes


" ================ Custom Settings ========================
so ~/.config/nvim/settings.vim
