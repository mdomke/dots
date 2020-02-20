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

let g:which_key_map.d = {
      \ 'name': '+diff',
      \ 'g':    ['diffget',     'get'],
      \ 'gt':   ['diffget //2', 'get-target'],
      \ 'gm':   ['diffget //3', 'get-merge'],
      \ 'p':    ['diffput',     'put'],
      \ 'u':    ['diffupdate',  'updated'],
      \}

let g:which_key_map.g = {
      \ 'name': '+git',
      \ 'a':    ['Gwrite',     'add'],
      \ 'b':    ['Gblame',     'blame'],
      \ 'c':    [':Git commit', 'commit'],
      \ 'm':    [':Git merge',  'merge'],
      \ 'p':    [':Git push',   'push'],
      \ 'pl':   [':Git pull',   'pull'],
      \ 'l':    ['GV',         'history'],
      \ 'lf':   ['GV!',        'history of file'],
      \ 's':    ['Gstatus',    'status'],
      \ }

nmap ghn <Plug>(GitGutterNextHunk)
nmap ghp <Plug>(GitGutterPrevHunk)
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghv <Plug>(GitGutterPreviewHunk)
