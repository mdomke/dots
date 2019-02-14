" Linter
" Plug 'scrooloose/syntastic'
" Plug 'w0rp/ale'
" Plug 'neomake/neomake'

" Completion
" Plug 'valloric/youcompleteme', { 'for': ['c', 'cpp', 'rust', 'javascript'], 'do': './install.py --clang-completer --gocode-completer --racer-completer --js-completer' }
" Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" HTML/CSS/LESS
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'skwp/vim-html-escape', { 'for': 'html' }
Plug 'mattn/emmet-vim', { 'for': 'html'}

" JavaScript/CoffeScript
Plug 'pangloss/vim-javascript', { 'for': 'javascript'}
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript'}
Plug 'itspriddle/vim-jquery', { 'for': 'javascript'}
Plug 'mxw/vim-jsx', { 'for': 'javascript'}
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

" Go
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoUpdateBinaries' }
Plug 'zchee/deoplete-go', { 'for': 'go', 'do': 'make'}

" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'racer-rust/vim-racer', { 'for': 'rust' }

" Other
" Plug 'jtratner/vim-flavored-markdown'
Plug 'rhysd/vim-gfm-syntax', { 'for': 'markdown' }
Plug 'dag/vim-fish'
Plug 'ElmCast/elm-vim', { 'for': 'elm'}
Plug 'honza/dockerfile.vim'
Plug 'chr4/nginx.vim'
Plug 'cespare/vim-toml'

" Python
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'python-mode/python-mode', { 'for': 'python' }
