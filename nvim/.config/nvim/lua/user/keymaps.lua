-- #---------#
-- #-globals-#
-- #---------#

local set = vim.keymap.set

set("", "<Space>", "<Nop>")
vim.g.mapleader = " "

-- #-----------#
-- #-reference-#
-- #-----------#

--[[
normal_mode = "n",
insert_mode = "i",
visual_mode = "v",
visual_block_mode = "x",
term_mode = "t",
command_mode = "c",
]]

-- #------#
-- #-core-#
-- #------#

-- split navigation
set("n", "<C-h>", "<C-w>h")
set("n", "<C-j>", "<C-w>j")
set("n", "<C-k>", "<C-w>k")
set("n", "<C-l>", "<C-w>l")

-- resize with arrows
set("n", "<C-Up>", ":resize -2<CR>")
set("n", "<C-Down>", ":resize +2<CR>")
set("n", "<C-Left>", ":vertical resize -2<CR>")
set("n", "<C-Right>", ":vertical resize +2<CR>")

-- faster scrolling
set("n", "<C-e>", "3<C-e>")
set("n", "<C-y>", "3<C-y>")

-- copy to end
set("n", "Y", "y$")

-- easy toggle fold
set("n", "Z", "za")

-- stay in indent mode
set("v", "<", "<gv")
set("v", ">", ">gv")

-- noh
set("n", "<leader><space>", ":noh<CR>")

-- #---------#
-- #-plugins-#
-- #---------#

-- illuminate
set("n", "'", function()
	require("illuminate").next_reference({ wrap = true })
end, { desc = "illuminate next reference" })

set("n", '"', function()
	require("illuminate").next_reference({ reverse = true, wrap = true })
end, { desc = "illuminate prev reference" })

-- bufdelete
local bf_ok, bf = pcall(require, "bufdelete")
if bf_ok then
	set("n", "<leader>d", function()
		bf.bufdelete(0, true)
	end, { desc = "Bufdelete without changing layout" })
else
	set("n", "<leader>d", ":bdelete<CR>")
end
