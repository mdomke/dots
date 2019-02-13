let g:lightline = {
  \ 'colorscheme': 'apprentice',
  \ 'active': {
  \   'left':  [[], ['fugitive', 'readonly', 'filename', 'modified']]
  \ },
  \ 'inactive': {
  \   'left':  [[], ['fugitive', 'readonly', 'filename', 'modified']],
  \   'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype']]
  \ },
  \ 'tabline': {
  \   'right': [[]],
  \ },
  \ 'component': {
  \   'lineinfo': "\ue0a1%3l:%-2v"
  \ },
  \ 'component_function': {
  \   'fugitive': 'LightLineFugitive',
  \   'filename': "LightLineFilename"
  \ },
  \ 'component_visible_condition': {
  \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
  \ },
  \ 'separator': { 'left': "", 'right': "" },
  \ 'subseparator': { 'left': "|", 'right': "|" }
  \ }


function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction


function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '\ue0a2' : ''
endfunction


function! LightLineFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? "\ue0a0 "._ : ''
  endif
  return ''
endfunction


function! LightLineFilename()
  return  ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != expand('%:t') ? pathshorten(expand('%')) : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction
