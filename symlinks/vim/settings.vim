call which_key#register(',', "g:which_key_map")
let g:which_key_map = {}

for fpath in split(globpath('~/.config/nvim/settings', '*.vim'), '\n')
  exe 'source' fpath
endfor
