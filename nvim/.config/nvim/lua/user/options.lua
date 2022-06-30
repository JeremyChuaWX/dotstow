local opt = vim.opt

-------------
-- general --
-------------
opt.compatible = false
opt.syntax = "on"
opt.clipboard = "unnamedplus"
opt.ttyfast = true
opt.lazyredraw = true
opt.updatetime = 50
opt.timeoutlen = 300
opt.mouse = "a"
opt.autochdir = true

---------------------------
-- backup, swap, viminfo --
---------------------------
opt.backup = false
opt.swapfile = false

-------------------------
-- file type detection --
-------------------------
opt.filetype = "on"

--------------------
-- tab completion --
--------------------
opt.wildmenu = true
opt.wildignore:append({ ".git", ".DS_Store" })
opt.wildignorecase = true
opt.wildmode = { "list", "longest" }

---------------
-- interface --
---------------
opt.ruler = true
opt.number = true
opt.showcmd = true
opt.cmdheight = 1
opt.laststatus = 3
opt.visualbell = true
opt.scrolloff = 10
opt.splitbelow = true
opt.splitright = true
opt.signcolumn = "yes"
opt.completeopt = { "menu", "menuone", "noselect" }

------------
-- editor --
------------
opt.encoding = "utf-8"
opt.wrap = true
opt.linebreak = true
opt.whichwrap = "b,s,<,>,[,]"
opt.joinspaces = false
opt.backspace = { "indent", "eol", "start" }

-------------
-- folding --
-------------
opt.foldlevelstart = 99
-- opt.foldcolumn = "1"
-- vim.opt.fillchars:append("foldopen:,foldclose:,foldsep: ")

---------------------
-- buffer and tabs --
---------------------
opt.hidden = true
opt.autoread = true

-----------------
-- indentation --
-----------------
opt.expandtab = true
opt.smarttab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.autoindent = true
opt.smartindent = true

----------------
-- appearance --
----------------
opt.background = "dark"
opt.cursorline = true
opt.termguicolors = true

------------
-- search --
------------
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true
opt.wrapscan = true
