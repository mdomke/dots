let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

let g:haskell_indent_disable = 0
" let g:haskell_indent_if = 3
let g:haskell_indent_case = 4
" let g:haskell_indent_let = 4
" let g:haskell_indent_in = 1
let g:haskell_indent_guard = 4
let g:haskell_indent_do = 3
" let g:haskell_indent_where = 6
let g:haskell_indent_before_where = 4
let g:haskell_indent_after_where = 4

let g:hindent_on_save = 0

let g:haskell_tabular = 1

set tags+=codex.tags;/

let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : 'hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type'
    \ },
    \ 'scope2kind' : {
        \ 'module' : 'm',
        \ 'class'  : 'c',
        \ 'data'   : 'd',
        \ 'type'   : 't'
    \ }
    \ }


nnoremap <silent> <leader>hh :Hoogle<cr>
nnoremap          <leader>hH :Hoogle
nnoremap <silent> <leader>hi :HoogleInfo<cr>
nnoremap <silent> <leader>hc :HoogleClose<cr>

nmap     <silent> <leader>ht :GhcModeType<cr>
nmap     <silent> <leader>hl :Neomake hlint<cr>
