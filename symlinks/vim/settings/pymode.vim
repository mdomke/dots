let g:pymode_doc = 0
let g:pymode_run = 0
let g:pymode_breakpoint = 1
let g:pymode_rope = 1
let g:pymode_lint = 1
" let g:pymode_lint_on_write = 0
" let g:pymode_lint_messages = 0

let g:pymode_options_max_line_length = 100


let g:pymode_breakpoint_bind = '<leader><leader>b'

let g:pymode_rope_regenerate_on_write = 0
let g:pymode_rope_completion = 0

let g:pymode_rope_run = ''
let g:pymode_rope_show_doc_bind = ''
let g:pymode_rope_rename_bind = '<leader>rr'
let g:pymode_rope_autoimport_bind = '<leader>ra'
let g:pymode_rope_organize_imports_bind = '<leader>ro'

" let g:pymode_virtualenv = 1
" let g:pymode_virtualenv_path = '/usr/local/var/pyenv/versions/p2'


nnoremap <leader>rg :PymodeRopeRegenerate<cr>

vmap <leader>oi !eingefuhrt<cr>
