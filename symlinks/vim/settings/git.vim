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
nnoremap <silent> <Leader>dg  :diffget<CR>
nnoremap <silent> <Leader>dgt :diffget //2<CR>
nnoremap <silent> <Leader>dgm :diffget //3<CR>
nnoremap <silent> <Leader>dp  :diffput<CR>
nnoremap <silent> <Leader>du  :diffupdate<CR>

nnoremap <silent> <Leader>gb  :Gblame<CR>
nnoremap <silent> <Leader>gs  :Gstatus<CR>
nnoremap <silent> <Leader>gc  :Gcommit --verbose<CR>
nnoremap <silent> <Leader>gm  :Gmerge<CR>
nnoremap <silent> <Leader>gpl :Gpull<CR>
nnoremap <silent> <Leader>gp  :Gpush<CR>
nnoremap <silent> <Leader>ga  :Gwrite<CR>

" list revisions
nnoremap <silent> <Leader>gl  :GV<CR>
" list revisions of current file
nnoremap <silent> <Leader>glf :GV!<CR>

nmap ghn <Plug>(GitGutterNextHunk)
nmap ghp <Plug>(GitGutterPrevHunk)
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghv <Plug>(GitGutterPreviewHunk)
