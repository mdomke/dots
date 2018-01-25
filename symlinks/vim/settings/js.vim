let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascript_eslint_exe = $PWD . '/node_modules/.bin/eslint'

let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']
