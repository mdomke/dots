" au FileType go set noexpandtab
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

aug filetype_go
  au!
  au FileType go set shiftwidth=4
  au FileType go set softtabstop=4
  au FileType go set tabstop=4
  au FileType go nmap gb :<C-u>call <SID>build_go_files()<CR>
  au FileType go nmap gr <Plug>(go-run)
  au FileType go nmap gl <Plug>(go-metalinter)
  au FileType go nmap <leader>gt :GoDeclsDir<cr>
  au Filetype go nmap <leader>ga <Plug>(go-alternate-edit)
  au Filetype go nmap <leader>gah <Plug>(go-alternate-split)
  au Filetype go nmap <leader>gav <Plug>(go-alternate-vertical)
  au Filetype go nmap <leader>gct <Plug>(go-coverage-toggle)
aug end

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 0
let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 1
let g:go_metalinter_enabled = ['govet', 'golint', 'errcheck', 'structcheck']
let g:go_metalinter_autosave_enabled = []
let g:go_addtags_transform = "snakecase"
let g:go_def_mode = "godef"
let g:go_def_mapping_enabled = 0

let g:go_fmt_options = {
    \ 'goimports': '-local gitlab.figo.systems',
    \ }


let g:deoplete#sources#go#pointer = 1
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
