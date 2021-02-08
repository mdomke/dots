"make Y consistent with C and D
nnoremap Y y$

" Make 0 go to the first character rather than the beginning
" of the line. When we're programming, we're almost always
" interested in working with text rather than empty space. If
" you want the traditional beginning of line, use ^
nnoremap 0 ^
nnoremap ^ 0

" Brackets are not very reachable on a non-US keyboard layout so that we
" remap them to - and _. This is mostly for vim-unimpaired
nmap - [
nmap _ ]
omap - [
omap _ ]
xmap - [
xmap _ ]

" Surround shortcuts
map  <Leader># ysiw#
vmap <Leader># c#{<C-R>"}<ESC>
let g:which_key_map['#'] = 'surround-#'

map  <Leader>" ysiw"
vmap <Leader>" c"<C-R>""<ESC>
let g:which_key_map['"'] = 'surround-"'

map  <Leader>' ysiw'
vmap <Leader>' c'<C-R>"'<ESC>
let g:which_key_map["'"] = "surround-'"

map  <Leader>( ysiw(
vmap <Leader>( c( <C-R>" )<ESC>
let g:which_key_map['('] = "surround-("

map  <Leader>) ysiw)
vmap <Leader>) c(<C-R>")<ESC>
let g:which_key_map[')'] = "surround-)"

map  <Leader>[ ysiw[
vmap <Leader>[ c[<C-R>"]<ESC>
let g:which_key_map['['] = "surround-["

map  <Leader>] ysiw]
vmap <Leader>] c[ <C-R>" ]<ESC>
let g:which_key_map[']'] = "surround-]"

map  <Leader>{ ysiw{
vmap <Leader>{ c{<C-R>"}<ESC>
let g:which_key_map['{'] = "surround-{"

map  <Leader>} ysiw}
vmap <Leader>} c{ <C-R>" }<ESC>
let g:which_key_map['}'] = "surround-}"

map  <Leader>` ysiw`
let g:which_key_map['`'] = "surround-`"

let g:which_key_map[','] = { 
      \ 'name': '+change',
      \ "'":    ["f'ci'",  "inside-'"],
      \ '"':    ['f"ci"',  'inside-"'],
      \ '(':    ['f(ci(',  'inside-('],
      \ ')':    ['f)ci)',  'inside-)'],
      \ '[':    ['f[ci[',  'inside-['],
      \ ']':    ['f]ci]',  'inside-]'],
      \ '{':    ['f{ci{',  'inside-{'],
      \ '}':    ['f}ci}',  'inside-}'],
      \ }


" Substitute with yanked text
xnoremap <Leader>p "_dP
nnoremap S "_diwP

nnoremap <Leader>. '.
let g:which_key_map['.'] = 'last-edit-loc'

"When typing a string, your quotes auto complete. Move past the quote while
"still in insert mode by hitting Ctrl-a. Example:
"
" type 'foo<c-a>
"
" the first quote will autoclose so you'll get 'foo' and hitting <c-a> will
" put the cursor right after the quote
imap <C-A> <ESC>la

" NERD tree
nmap <Leader>< :NERDTreeToggle<CR>
let g:which_key_map['<'] = 'nerdtree-toggle'

" Quickfix window
let g:which_key_map.q = {
      \ 'name': '+quickfix',
      \ 'c':    ['cclose',  'close'],
      \ 'o':    ['cwindow', 'open'],
      \ 'l':    ['cl',      'list'],
      \ 'n':    ['cne',     'next'],
      \ 'p':    ['cp',      'previous'],
      \}

" Location list
let g:which_key_map.l = {
      \ 'name': '+location',
      \ 'c':    ['lclose',  'close'],
      \ 'o':    ['lwindow', 'open'],
      \ 'l':    ['ll',      'list'],
      \ 'n':    ['lne',     'next'],
      \ 'p':    ['lp',      'previous'],
      \}

" Buffer movements
nnoremap <silent> <Leader>x :bp<CR>
let g:which_key_map.x = 'buffer-prev'

nnoremap <silent> <Leader>n :bn<CR>
let g:which_key_map.n = 'buffer-next'

" ==============================
" Window/Tab/Split Manipulation
" ==============================
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l
nnoremap <C-K> <C-W>k
nnoremap <C-J> <C-W>j

" Vertical/horizontal splits
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" ============================
" Shortcuts for everyday tasks
" ============================
let g:which_key_map.c = { 'name': '+current' }

nnoremap <silent> <Leader>cf :let @* = expand("%:~")<CR>
let g:which_key_map.c.f = 'copy-file-path'

nnoremap <silent> <Leader>cn :let @* = expand("%:t")<CR>
let g:which_key_map.c.n = 'copy-file-name'
"
map <silent> <Leader>cd :r! date "+\%Y-\%m-\%d \%H:\%M:\%S"<CR>
let g:which_key_map.c.d = 'date'

nnoremap <silent> <leader> :<C-U>WhichKey ','<CR>
vnoremap <silent> <leader> :<C-U>WhichKeyVisual ','<CR>

autocmd FileType vista,vista_kind nnoremap <buffer> <silent> / :<c-u>call vista#finder#fzf#Run()<CR>
