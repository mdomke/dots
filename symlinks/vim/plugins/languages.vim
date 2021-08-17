" Linter
" Plug 'scrooloose/syntastic'
" Plug 'neomake/neomake'
" Plug 'dense-analysis/ale'

" Completion
" Plug 'valloric/youcompleteme', { 'for': ['c', 'cpp', 'rust', 'javascript'], 'do': './install.py --clang-completer --gocode-completer --racer-completer --js-completer' }
" Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
" Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'

" HTML/CSS/LESS
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'skwp/vim-html-escape', { 'for': 'html' }
Plug 'mattn/emmet-vim', { 'for': 'html'}

" JavaScript/CoffeScript
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'typescript'] }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript'}
Plug 'itspriddle/vim-jquery', { 'for': 'javascript'}
Plug 'mxw/vim-jsx', { 'for': 'javascript'}
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
Plug 'fatih/vim-go', { 'for': 'go' }
" Plug 'zchee/deoplete-go', { 'for': 'go', 'do': 'make'}

" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'racer-rust/vim-racer', { 'for': 'rust' }

" Other
" Plug 'jtratner/vim-flavored-markdown'
Plug 'rhysd/vim-gfm-syntax', { 'for': 'markdown' }
Plug 'dag/vim-fish', { 'for': 'fish' }
Plug 'ElmCast/elm-vim', { 'for': 'elm' }
Plug 'honza/dockerfile.vim'
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'chrisbra/csv.vim'
Plug 'tsandall/vim-rego'

" Python
" Plug 'davidhalter/jedi-vim', { 'for': 'python' }
" Plug 'zchee/deoplete-jedi', { 'for': 'python' }
" Plug 'python-mode/python-mode', { 'for': 'python' , 'branch': 'develop' }
