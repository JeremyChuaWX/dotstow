-- #---------#
-- #-globals-#
-- #---------#

local set = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- #------#
-- #-core-#
-- #------#

-- netrw
set("n", "<leader>e", ":15Lexplore<CR>", opts)

-- split navigation
set("n", "<C-h>", "<C-w>h", opts)
set("n", "<C-j>", "<C-w>j", opts)
set("n", "<C-k>", "<C-w>k", opts)
set("n", "<C-l>", "<C-w>l", opts)

-- buffer
set("n", "<leader>d", ":bdelete<CR>", opts)

-- faster scrolling
set("n", "<C-e>", "3<C-e>", opts)
set("n", "<C-y>", "3<C-y>", opts)

-- copy to end
set("n", "Y", "y$", opts)

-- #---------#
-- #-plugins-#
-- #---------#

-- bufferline
set("n", "L", ":BufferLineCycleNext<CR>", opts)
set("n", "H", ":BufferLineCyclePrev<CR>", opts)
set("n", "<leader>L", ":BufferLineMoveNext<CR>", opts)
set("n", "<leader>H", ":BufferLineMovePrev<CR>", opts)

-- telescope
set("n", "<leader>f", ":Telescope find_files<CR>", opts)

-- neogit
set("n", "<leader>gg", ":Neogit<CR>", opts)
