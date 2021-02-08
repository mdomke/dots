noremap <Leader>t :FloatermToggle<CR>
let g:which_key_map.t = 'terminal'

let g:floaterm_position = 'center'
let g:floaterm_winblend = 10
let g:floaterm_background = '#1C1C1C'
let g:floaterm_border_color = '#1C1C1C'
let g:floaterm_height = float2nr(0.6 * &lines)
let g:floaterm_width = float2nr(0.8 * &columns)

let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<F12>'
