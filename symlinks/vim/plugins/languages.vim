" Syntax 
" Plug 'scrooloose/syntastic'
" Plug 'valloric/youcompleteme', { 'for': ['python', 'c', 'cpp', 'go', 'rust'], 'do': './install.py --clang-completer --gocode-completer --racer-completer' }
Plug 'neomake/neomake'
Plug 'davidhalter/jedi-vim', { 'for': 'python' }

Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
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
Plug 'carlitux/deoplete-ternjs', { 'for': 'javascript', 'do': 'yarn global add tern' }

" Haskell
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell'}
Plug 'itchyny/vim-haskell-indent', { 'for': 'haskell'}
Plug 'alx741/vim-hindent', { 'for': 'haskell'}
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
Plug 'mpickering/hlint-refactor-vim', { 'for': 'haskell' }
Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }

" Other
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
" Plug 'jtratner/vim-flavored-markdown'
Plug 'rhysd/vim-gfm-syntax', { 'for': 'markdown' }
Plug 'dag/vim-fish'
Plug 'ElmCast/elm-vim', { 'for': 'elm'}
Plug 'kylef/apiblueprint.vim'

" Python
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

" Dockerfile
Plug 'docker/docker', { 'rtp': 'contrib/syntax/vim' }

Plug 'luan/vim-concourse'
