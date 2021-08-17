let g:fzf_layout = { 'down': '~20%' }
let g:fzf_buffers_jump = 1

nnoremap <silent> <Leader>f  :Files<CR>
" nnoremap <silent> <Leader>f  :call fzf#vim#files('.')<CR>
let g:which_key_map.f = 'fzf-files'

nnoremap <silent> <Leader>b  :Buffers<CR>
let g:which_key_map.b = 'fzf-buffers'

nnoremap <silent> <Leader>ag :Ag<CR>
nnoremap <silent> <Leader>rg :RipGrep<CR>
nnoremap <silent> <Leader>rw :RipGrep <C-R><C-W><CR>

nnoremap <silent> <Leader>h  :History:<CR>
let g:which_key_map.h = 'fzf-history'

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(
  \   <q-args>,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

command! -bang -nargs=* RipGrep
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

nnoremap <silent> <Leader>gg :Gbranch<CR>
command! -bang Gbranch
  \ call fzf#run(
  \   fzf#wrap({
  \     'source': 'git branch -v --color=always',
  \     'sink': function('s:change_branch'),
  \     'options': '--ansi --nth=1',
  \   },
  \   <bang>0))

function! s:change_branch(branch)
  let l:name = split(trim(a:branch), "", 1)[0]
  execute 'Git checkout ' . l:name
endfunction

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'SignColumn', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Constant'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

if has('nvim') && exists('&winblend') && &termguicolors
  autocmd! FileType fzf
  autocmd  FileType fzf set noshowmode noruler nonu

  set winblend=10
  hi link NormalFloat SignColumn
  if exists('g:fzf_colors.bg')
    call remove(g:fzf_colors, 'bg')
  endif

  if stridx($FZF_DEFAULT_OPTS, '--margin') == -1
    let $FZF_DEFAULT_OPTS .= ' --margin=1,3'
  endif
  " let $FZF_DEFAULT_OPTS .= ' --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:-1'

  function! FloatingFZF()
    let width = float2nr(&columns * 0.8)
    let height = float2nr(&lines * 0.6)
    let opts = { 'relative': 'editor',
               \ 'row':      (&lines - height) / 2,
               \ 'col':      (&columns - width) / 2,
               \ 'width':    width,
               \ 'height':   height,
               \ 'style':    'minimal' }

    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
  endfunction

  let g:fzf_layout = { 'window': 'call FloatingFZF()' }
endif
