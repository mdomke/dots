" Syntax 
" Plug 'scrooloose/syntastic'
" Plug 'valloric/youcompleteme', { 'for': ['python', 'c', 'cpp', 'go', 'rust'], 'do': './install.py --clang-completer --gocode-completer --racer-completer' }
Plug 'neomake/neomake'
Plug 'davidhalter/jedi-vim', { 'for': 'python' }

Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }


" HTML/CSS/LESS
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'skwp/vim-html-escape', { 'for': 'html' }
Plug 'mattn/emmet-vim', { 'for': 'html'}

" JavaScript/CoffeScript
Plug 'pangloss/vim-javascript', { 'for': 'javascript'}
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript'}
Plug 'itspriddle/vim-jquery', { 'for': 'javascript'}
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee'}

" Haskell
Plug 'neovimhaskell/haskell-vim'
Plug 'alx741/vim-hindent'
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }

" Other
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
Plug 'jtratner/vim-flavored-markdown'
Plug 'dag/vim-fish'

" Python
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

" Dockerfile
Plug 'docker/docker', { 'rtp': 'contrib/syntax/vim' }

Plug 'luan/vim-concourse'
