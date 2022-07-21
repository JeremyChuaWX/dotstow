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
normal_mode       = "n",
insert_mode       = "i",
visual_mode       = "v",
visual_block_mode = "x",
term_mode         = "t",
command_mode      = "c",
]]

-- #------#
-- #-core-#
-- #------#

-- split navigation
set("n", "<C-h>", "<C-w>h")
set("n", "<C-j>", "<C-w>j")
set("n", "<C-k>", "<C-w>k")
set("n", "<C-l>", "<C-w>l")

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

-- align
set("x", "aa", function()
    require("align").align_to_char(1, true)
end, { desc = "Aligns to 1 character, looking left" })
set("x", "as", function()
    require("align").align_to_char(2, true, true)
end, { desc = "Aligns to 2 characters, looking left and with previews" })
set("x", "aw", function()
    require("align").align_to_string(false, true, true)
end, { desc = "Aligns to a string, looking left and with previews" })
set("x", "ar", function()
    require("align").align_to_string(true, true, true)
end, { desc = "Aligns to a Lua pattern, looking left and with previews" })

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
