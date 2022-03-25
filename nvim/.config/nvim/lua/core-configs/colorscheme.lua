vim.cmd [[
" everforest
let g:everforest_enable_italic = 1
let g:everforest_better_performance = 1

" tokyo night
let g:tokyonight_style = "night"
]]

local colorscheme = "kanagawa"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end
