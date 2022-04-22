-- #---------#
-- #-globals-#
-- #---------#

local set = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- #------#
-- #-core-#
-- #------#

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

-- easy toggle fold
set("n", "Z", "za", opts)
