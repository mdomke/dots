" Syntax 
" Plug 'scrooloose/syntastic'
Plug 'valloric/youcompleteme', { 'for': ['c', 'cpp', 'rust', 'javascript'], 'do': './install.py --clang-completer --gocode-completer --racer-completer --js-completer' }
" Plug 'w0rp/ale'
Plug 'neomake/neomake'

Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'zchee/deoplete-go', { 'for': 'go' }

" HTML/CSS/LESS
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'skwp/vim-html-escape', { 'for': 'html' }
Plug 'mattn/emmet-vim', { 'for': 'html'}

" JavaScript/CoffeScript
Plug 'pangloss/vim-javascript', { 'for': 'javascript'}
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript'}
Plug 'itspriddle/vim-jquery', { 'for': 'javascript'}
Plug 'mxw/vim-jsx', { 'for': 'javascript'}
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee'}
Plug 'ternjs/tern_for_vim', { 'for': 'javascript' , 'do': 'yarn global add tern'}
Plug 'carlitux/deoplete-ternjs', { 'for': 'javascript', 'do': 'yarn global add tern' }
Plug 'moll/vim-node', { 'for': 'javascript' }

" Haskell
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell'}
Plug 'itchyny/vim-haskell-indent', { 'for': 'haskell'}
Plug 'alx741/vim-hindent', { 'for': 'haskell'}
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
Plug 'mpickering/hlint-refactor-vim', { 'for': 'haskell' }
Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }

" Other
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
" Plug 'jtratner/vim-flavored-markdown'
Plug 'rhysd/vim-gfm-syntax', { 'for': 'markdown' }
Plug 'dag/vim-fish'
Plug 'ElmCast/elm-vim', { 'for': 'elm'}
Plug 'kylef/apiblueprint.vim'

" Python
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
" Plug 'davidhalter/jedi-vim', { 'for': 'python' }

" Dockerfile
Plug 'docker/docker', { 'rtp': 'contrib/syntax/vim' }

Plug 'luan/vim-concourse'

Plug 'chr4/nginx.vim'

Plug 'cespare/vim-toml'
