local options = {
    -------------
    -- general --
    -------------
    compatible = false,
    syntax = "on",
    clipboard = { "unnamed", "unnamedplus", },
    ttyfast = true,
    lazyredraw = true,
    updatetime = 50,
    -- timeout = true,
    -- ttimeout = true,
    timeoutlen = 300,
    -- ttimeoutlen = 10,
    mouse = "a",
    autochdir = true,

    ---------------------------
    -- backup, swap, viminfo --
    ---------------------------
    backup = false,
    swapfile = false,

    -------------------------
    -- file type detection --
    -------------------------
    filetype = "on",
    -- filetype plugin
    -- filetype indent

    --------------------
    -- tab completion --
    --------------------
    wildmenu = true,
    wildignore = vim.opt.wildignore + { ".git", ".DS_Store", },
    wildignorecase = true,
    wildmode = { "list", "longest", },

    ---------------
    -- interface --
    ---------------
    ruler = true,
    -- relativenumber = true,
    number = true,
    showcmd = true,
    cmdheight = 2,
    laststatus = 3,
    visualbell = true,
    scrolloff = 8,
    splitbelow = true,
    splitright = true,
    signcolumn = "yes",
    completeopt = { "menu", "menuone", "noselect", },
    colorcolumn = "100",

    ------------
    -- editor --
    ------------
    encoding = "utf-8",
    wrap = true,
    linebreak = true,
    -- matchpairs = vim.opt.matchpairs + "<:>",
    whichwrap = "b,s,<,>,[,]",
    joinspaces = false,
    backspace = { "indent", "eol", "start", },
    foldlevelstart = 99,

    ---------------------
    -- buffer and tabs --
    ---------------------
    hidden = true,
    autoread = true,

    -----------------
    -- indentation --
    -----------------
    expandtab = true,
    smarttab = true,
    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    autoindent = true,
    smartindent = true,

    ----------------
    -- appearance --
    ----------------
    background = "dark",
    cursorline = true,
    termguicolors = true,

    ------------
    -- search --
    ------------
    ignorecase = true,
    smartcase = true,
    hlsearch = true,
    incsearch = true,
    wrapscan = true
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- let g:loaded_clipboard_provider="clipboard-x11"
if vim.fn.has "unix" == 1 then
    vim.cmd [[
        let g:loaded_clipboard_provider="clipboard-x11"
    ]]
end
