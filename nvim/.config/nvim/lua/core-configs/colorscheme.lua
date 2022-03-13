vim.cmd [[
" everforest
let g:everforest_enable_italic = 1
let g:everforest_better_performance = 1

" tokyo night
let g:tokyonight_style = "night"

try
    colorscheme tokyonight
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
endtry
]]
