set incsearch       " Find the next match as we type the search
set hlsearch        " Hilight searches by default
set viminfo='100,f1 " Save up to 100 marks, enable capital marks
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

set grepprg=ag
let g:grep_cmd_opts = '--line-number --no-heading'

" Type ,hl to toggle highlighting on/off, and show current value.
noremap // :set hlsearch! hlsearch?<CR>

let g:indexed_search_mappings = 0
noremap <silent> <Plug>(slash-after) :<C-u>ShowSearchIndex<CR>
xunmap <Plug>(slash-after)
