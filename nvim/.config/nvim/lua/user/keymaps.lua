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

-- buffer
set("n", "<leader>d", ":bdelete<CR>")

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

-- telescope
set("n", "tt", ":Telescope<CR>")

set("n", "tf", function()
	require("telescope.builtin").find_files({})
end, { desc = "telescope find files" })

set("n", "tg", function()
	require("telescope.builtin").live_grep({})
end, { desc = "telescope live grep" })

set("n", "th", function()
	require("telescope.builtin").help_tags({})
end, { desc = "telescope help tags" })

set("n", "tb", function()
	require("telescope.builtin").current_buffer_fuzzy_find({})
end, { desc = "telescope fuzzy find current buffer" })

set("n", "tB", function()
	require("telescope.builtin").buffers({})
end, { desc = "telescope buffers" })

set("n", "ts", function()
	require("telescope.builtin").git_status({})
end, { desc = "telescope git status" })

set("n", "td", function()
	require("telescope.builtin").diagnostics({})
end, { desc = "telescope diagnostics" })

-- bufferline
set("n", "L", ":BufferLineCycleNext<CR>")
set("n", "H", ":BufferLineCyclePrev<CR>")
set("n", "<leader>L", ":BufferLineMoveNext<CR>")
set("n", "<leader>H", ":BufferLineMovePrev<CR>")

-- nvimtree
set("", "<leader>e", ":NvimTreeToggle<CR>")

-- zen-mode
set("n", "<leader>z", function()
	require("zen-mode").toggle()
end, { desc = "open zen-mode" })

-- dap
set("n", "<leader>b", function()
	require("dap").toggle_breakpoint()
end, { desc = "dap toggle breakpoint" })

set("n", "<F5>", function()
	require("dap").continue()
end, { desc = "dap continue" })

set("n", "<F10>", function()
	require("dap").step_over()
end, { desc = "dap step over" })

set("n", "<F11>", function()
	require("dap").step_into()
end, { desc = "dap step into" })

set("n", "<F12>", function()
	require("dap").step_out()
end, { desc = "dap step out" })

set("n", "<leader>t", function()
	require("dap").terminate()
end, { desc = "dap terminate" })

-- illuminate
set("n", "<C-o>", function()
	require("illuminate").next_reference({ wrap = true })
end, { desc = "illuminate next reference" })

set("n", "<C-i>", function()
	require("illuminate").next_reference({ reverse = true, wrap = true })
end, { desc = "illuminate prev reference" })

-- symbols outline
set("n", "<leader>s", ":SymbolsOutline<CR>")

-- icon picker
set("i", "<C-i>", "<cmd>PickIconsInsert<cr>")
set("n", "<Leader>i", "<cmd>PickIcons<cr>")
