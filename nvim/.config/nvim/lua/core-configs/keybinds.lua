-- #---------#
-- #-globals-#
-- #---------#

local set = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

set("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- #-----------#
-- #-reference-#
-- #-----------#

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- #------#
-- #-core-#
-- #------#

-- split navigation
set("n", "<C-h>", "<C-w>h", opts)
set("n", "<C-j>", "<C-w>j", opts)
set("n", "<C-k>", "<C-w>k", opts)
set("n", "<C-l>", "<C-w>l", opts)

-- resize with arrows
set("n", "<C-Up>", ":resize -2<CR>", opts)
set("n", "<C-Down>", ":resize +2<CR>", opts)
set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- buffer
set("n", "<leader>d", ":bdelete<CR>", opts)

-- faster scrolling
set("n", "<C-e>", "3<C-e>", opts)
set("n", "<C-y>", "3<C-y>", opts)

-- copy to end
set("n", "Y", "y$", opts)

-- easy toggle fold
set("n", "Z", "za", opts)

-- stay in indent mode
set("v", "<", "<gv", opts)
set("v", ">", ">gv", opts)

-- noh
set("n", "<leader><space>", ":noh<CR>", opts)
