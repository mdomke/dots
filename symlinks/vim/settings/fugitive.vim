" fugitive.git
" ========================================
" For fugitive.git, dp means :diffput. Define dg to mean :diffget
nnoremap <silent> ,dg :diffget<CR>
nnoremap <silent> ,dgt :diffget //2<CR>
nnoremap <silent> ,dgm :diffget //3<CR>
nnoremap <silent> ,dp :diffput<CR>
nnoremap <silent> ,du :diffupdate<CR>

nnoremap <silent> ,gb :Gblame<CR>
nnoremap <silent> ,gs :Gstatus<CR>
nnoremap <silent> ,gc :Gcommit --verbose<CR>
nnoremap <silent> ,gm :Gmerge<CR>
nnoremap <silent> ,gpl :Gpull<CR>
nnoremap <silent> ,gp :Gpush<CR>
nnoremap <silent> ,ga :Gwrite<CR>
