" Use truecolor in nvim
set termguicolors

" Colorscheme seoul256
let g:seoul256_background = 235

set background=dark

colorscheme apprentice


if has("gui_running")
  "tell the term has 256 colors
  set t_Co=256

  autocmd VimEnter * set guitablabel=%N:\ %t\ %M
  set lines=60
  set columns=190
  set guifont=Consolas:h11,Inconsolata:h11,Monaco:h12
endif
