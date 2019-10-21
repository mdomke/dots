" ========================================
" General vim sanity improvements
" ========================================
"
"
" alias yw to yank the entire word 'yank inner word'
" even if the cursor is halfway inside the word
" FIXME: will not properly repeat when you use a dot (tie into repeat.vim)
nnoremap ,yw yiwvew

" ,ow = 'overwrite word', replace a word with what's in the yank buffer
" FIXME: will not properly repeat when you use a dot (tie into repeat.vim)
nnoremap ,ow "_diwhp

"make Y consistent with C and D
nnoremap Y y$

" Make 0 go to the first character rather than the beginning
" of the line. When we're programming, we're almost always
" interested in working with text rather than empty space. If
" you want the traditional beginning of line, use ^
nnoremap 0 ^
nnoremap ^ 0

" Surround shortcuts
map  <Leader># ysiw#
vmap <Leader># c#{<C-R>"}<ESC>

map  <Leader>" ysiw"
vmap <Leader>" c"<C-R>""<ESC>

map  <Leader>' ysiw'
vmap <Leader>' c'<C-R>"'<ESC>

map  <Leader>( ysiw(
map  <Leader>) ysiw)
vmap <Leader>( c( <C-R>" )<ESC>
vmap <Leader>) c(<C-R>")<ESC>

map  <Leader>] ysiw]
map  <Leader>[ ysiw[
vmap <Leader>] c[ <C-R>" ]<ESC>
vmap <Leader>[ c[<C-R>"]<ESC>

map  <Leader>} ysiw}
map  <Leader>{ ysiw{
vmap <Leader>} c{ <C-R>" }<ESC>
vmap <Leader>{ c{<C-R>"}<ESC>

map  <Leader>` ysiw`

" Change inside various enclosures with ,,-" and ,,-'
" The f makes it find the enclosure so you don't have
" to be standing inside it
nnoremap <Leader><Leader>' f'ci'
nnoremap <Leader><Leader>" f"ci"
nnoremap <Leader><Leader>( f(ci(
nnoremap <Leader><Leader>) f)ci)
nnoremap <Leader><Leader>[ f[ci[
nnoremap <Leader><Leader>] f]ci]


" Substitute with yanked text
xnoremap <Leader>p "_dP
nnoremap S "_diwP

"Go to last edit location with ,.
nnoremap <Leader>. '.

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

" Quickfix window
nmap <silent> <Leader>qc :cclose<CR>
nmap <silent> <Leader>qo :cwindow<CR>
nmap <Leader>ql :cl<CR>
nmap <Leader>qn :cne<CR>
nmap <Leader>qp :cp<CR>

" Location list
nmap <silent> <Leader>lc :lclose<CR>
nmap <silent> <Leader>lo :lwindow<CR>
nmap <Leader>ll :ll<CR>
nmap <Leader>ln :lne<CR>
nmap <Leader>lp :lp<CR>

" Buffer movements
nnoremap <silent> <Leader>x :bp<CR>
nnoremap <silent> <Leader>n :bn<CR>

" ==============================
" Window/Tab/Split Manipulation
" ==============================
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l
nnoremap <C-K> <C-W>k
nnoremap <C-J> <C-W>j

" Zoom in and out of current window with ,gz
map <silent> ,z <C-w>o

" Vertical/horizontal splits
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" ============================
" Shortcuts for everyday tasks
" ============================

" copy current filename into system clipboard - mnemonic: (c)urrent(f)ilename
" this is helpful to paste someone the path you're looking at
nnoremap <silent> <Leader>cf :let @* = expand("%:~")<CR>
nnoremap <silent> <Leader>cn :let @* = expand("%:t")<CR>

" ============================
" SplitJoin plugin
" ============================
let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''
nnoremap gss :SplitjoinSplit<cr>
nnoremap gsj :SplitjoinJoin<cr>

" ,hp = html preview
map <silent> <Leader>hp :!open %<CR><CR>

" insert current date
map <silent> <Leader>cd :r! date "+\%Y-\%m-\%d \%H:\%M:\%S"<CR>
