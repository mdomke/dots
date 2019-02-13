" Color palette
let s:c00 = "#1c1c1c"
let s:c01 = "#af5f5f"
let s:c02 = "#5f875f"
let s:c03 = "#87875f"
let s:c04 = "#5f87af"
let s:c05 = "#5f5f87"
let s:c06 = "#5f8787"
let s:c07 = "#6c6c6c"
let s:c08 = "#585858"
let s:c09 = "#ff8700"
let s:c0A = "#87af87"
let s:c0B = "#ffffaf"
let s:c0C = "#8fafd7"
let s:c0D = "#8787af"
let s:c0E = "#5fafaf"
let s:c0F = "#ffffff"
let s:cBG = "#262626"
let s:cFG = "#bcbcbc"

let s:a00 = "234"
let s:a01 = "131"
let s:a02 = "65"
let s:a03 = "101"
let s:a04 = "67"
let s:a05 = "60"
let s:a06 = "66"
let s:a07 = "242"
let s:a08 = "240"
let s:a09 = "208"
let s:a0A = "108"
let s:a0B = "229"
let s:a0C = "110"
let s:a0D = "103"
let s:a0E = "73"
let s:a0F = "231"
let s:aBG = "235"
let s:aFG = "250"

let g:lightline#colorscheme#apprentice#palette = {
\   'inactive': {
\     'left':    [[s:cBG, s:c08, s:aBG, s:a08], [s:cBG, s:c08, s:aBG, s:a08]],
\     'middle':  [[s:c08, s:cBG, s:a08, s:aBG]],
\     'right':   [[s:cBG, s:c07, s:aBG, s:a07], [s:cBG, s:c08, s:aBG, s:a08]]
\   },
\   'insert': {
\     'left':    [[s:cBG, s:c0A, s:aBG, s:a0A], [s:cFG, s:c08, s:aFG, s:a08]],
\     'right':   [[s:cBG, s:c0A, s:aBG, s:a0A], [s:cFG, s:c08, s:aFG, s:a08]]
\   },
\   'normal': {
\     'left':    [[s:cBG, s:c04, s:aBG, s:a04], [s:cFG, s:c08, s:aFG, s:a08]],
\     'middle':  [[s:cFG, s:cBG, s:aFG, s:aBG]],
\     'right':   [[s:cBG, s:c04, s:aBG, s:a04], [s:cFG, s:c08, s:aFG, s:a08]],
\     'error':   [[s:c00, s:c01, s:a00, s:a01]],
\     'warning': [[s:c00, s:c09, s:a00, s:a09]]
\   },
\   'replace': {
\     'left':    [[s:cBG, s:c01, s:aBG, s:a01], [s:cFG, s:c08, s:aFG, s:a08]],
\     'right':   [[s:cBG, s:c01, s:aBG, s:a01], [s:cFG, s:c08, s:aFG, s:a08]]
\   },
\   'tabline': {
\     'left':    [[s:cBG, s:c08, s:aBG, s:a08]],
\     'middle':  [[s:cFG, s:cBG, s:aFG, s:aBG]],
\     'right':   [[s:cBG, s:c08, s:aBG, s:a08]],
\     'tabsel':  [[s:cBG, s:c04, s:aBG, s:a04]]
\   },
\   'visual': {
\     'left':    [[s:cBG, s:c0B, s:aBG, s:a0B], [s:cFG, s:c08, s:aFG, s:a08]],
\     'right':   [[s:cBG, s:c0B, s:aBG, s:a0B], [s:cFG, s:c08, s:aFG, s:a08]]
\   }
\ }

