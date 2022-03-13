local options = {
    -- general
    compatible = false,
    syntax = "on",
    clipboard = {"unnamed", "unnamedplus"},
    ttyfast = true,
    lazyredraw = true,
    updatetime = 50,
    timeout = true,
    ttimeout = true,
    timeoutlen = 300,
    ttimeoutlen = 10,
    mouse = "a",

    -- backup, swap, viminfo
    backup = false,
    swapfile = false,

    -- file type detection
    filetype = "on",
    -- filetype plugin
    -- filetype indent

    -- tab completion
    wildmenu = true,
    wildignore = vim.opt.wildignore + {".git", ".DS_Store"},
    wildignorecase = true,
    wildmode = {"list", "longest"},

    -- interface
    ruler = true,
    relativenumber = true,
    number = true,
    showcmd = true,
    cmdheight = 2,
    laststatus = 2,
    visualbell = true,
    scrolloff = 8,
    splitbelow = true,
    splitright = true,
    signcolumn = "yes",
    completeopt = {"menuone", "noselect", "menu"},

    -- editor
    encoding = "utf-8",
    wrap = true,
    linebreak = true,
    matchpairs = vim.opt.matchpairs + "<:>",
    whichwrap = "b,s,<,>,[,]",
    joinspaces = false,
    backspace = {"indent", "eol", "start"},
    formatoptions = vim.opt.formatoptions - "tcro",
    formatoptions = vim.opt.formatoptions + "j",

    -- buffer and tabs
    hidden = true,
    autoread = true,

    -- indentation
    expandtab = true,
    smarttab = true,
    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    autoindent = true,
    smartindent = true,

    -- appearance
    background = "dark",
    cursorline = true,
    termguicolors = true,

    -- search
    ignorecase = true,
    smartcase = true,
    hlsearch = true,
    incsearch = true,
    wrapscan = true
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- #----------#
-- #-vim cmds-#
-- #----------#

-- Statusline
vim.cmd [[
let g:currentmode={
       \ 'n'  : ' NORMAL ',
       \ 'v'  : ' VISUAL ',
       \ 'V'  : ' V·LINE ',
       \ "\<C-V>" : ' V·BLOCK ',
       \ 'i'  : ' INSERT ',
       \ 'R'  : ' REPLACE ',
       \ 'Rv' : ' V·REPLACE ',
       \ 'c'  : ' COMMAND ',
       \}

set statusline+=\ 
set statusline+=%#Search#
set statusline+=%{g:currentmode[mode()]}
set statusline+=%*
set statusline+=\ 
set statusline+=%1n\:
set statusline+=\ 
set statusline+=%F
set statusline+=%{&modified?'[+]':''}
set statusline+=%=
set statusline+=%#Search#
set statusline+=\ %y\ 
set statusline+=%*
set statusline+=\ 
set statusline+=%l/%L
set statusline+=\ 
]]


-- Netrw options
vim.cmd [[
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide().",.*\.swp$".",.DS_Store"
let g:netrw_banner=0
]]
