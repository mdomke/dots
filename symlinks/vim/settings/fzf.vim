let g:fzf_layout = { 'down': '~20%' }
let g:fzf_buffers_jump = 1

nnoremap <silent> ,f :Files<CR>
nnoremap <silent> ,b :Buffers<cr>
nnoremap <silent> ,gf :GitFiles?<cr>
nnoremap <silent> ,ag :Ag<cr>
nnoremap <silent> ,h: :History:<cr>
