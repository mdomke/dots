let g:fzf_layout = { 'down': '~20%' }
let g:fzf_buffers_jump = 1

nnoremap <silent> ,f :Files<CR>
nnoremap <silent> ,b :Buffers<cr>
nnoremap <silent> ,gf :GitFiles?<cr>
nnoremap <silent> ,ag :Ag<cr>
nnoremap <silent> ,h: :History:<cr>

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
