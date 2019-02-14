" The tree buffer makes it easy to drill down through the directories of your
" git repository, but it’s not obvious how you could go up a level to the
" parent directory. Here’s a mapping of .. to the above command, but
" only for buffers containing a git blob or tree
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif

" Every time you open a git object using fugitive it creates a new buffer. 
" This means that your buffer listing can quickly become swamped with 
" fugitive buffers. This prevents this from becomming an issue:
autocmd BufReadPost fugitive://* set bufhidden=delete

" fugitive.git
" ========================================
" For fugitive.git, dp means :diffput. Define dg to mean :diffget
nnoremap <silent> ,dg  :diffget<CR>
nnoremap <silent> ,dgt :diffget //2<CR>
nnoremap <silent> ,dgm :diffget //3<CR>
nnoremap <silent> ,dp  :diffput<CR>
nnoremap <silent> ,du  :diffupdate<CR>

nnoremap <silent> ,gb  :Gblame<CR>
nnoremap <silent> ,gs  :Gstatus<CR>
nnoremap <silent> ,gc  :Gcommit --verbose<CR>
nnoremap <silent> ,gm  :Gmerge<CR>
nnoremap <silent> ,gpl :Gpull<CR>
nnoremap <silent> ,gp  :Gpush<CR>
nnoremap <silent> ,ga  :Gwrite<CR>

" list revisions
nnoremap <silent> ,gl  :GV<CR>
" list revisions of current file
nnoremap <silent> ,glf :GV!<CR>
