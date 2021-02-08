let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']

nmap <buffer> <Leader>v :Vista<cr>
let g:which_key_map.v = 'outline'

autocmd FileType vista,vista_kind nnoremap <buffer> <silent> / :call vista#finder#fzf#Run()<cr>
