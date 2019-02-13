let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascript_eslint_exe = $PWD . '/node_modules/.bin/eslint'

let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

let g:tern_show_argument_hints = 'on_hold'
let g:tern_show_signature_in_pum = 1

nnoremap gd :TernDef<cr>
nnoremap <leader>jr :TernRename<cr>
nnoremap <leader>su :TernRefs<cr>
