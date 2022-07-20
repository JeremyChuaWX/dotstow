local hydra_status, hydra = pcall(require, "hydra")
if not hydra_status then
	return
end

local splits_status, splits = pcall(require, "smart-splits")
if not splits_status then
	return
end

local hint = [[
 ^^^Focus^^^   ^^  Sizing   ^^ 
 ^^^-----^^^   ^^-----------^^ 
 ^ ^ _k_ ^ ^   ^   _<C-k>_   ^ 
 _h_ ^ ^ _l_   _<C-h>_ _<C-l>_ 
 ^ ^ _j_ ^ ^   ^   _<C-j>_   ^ 
 ^ ^ ^ ^ ^ ^   ^_=_: equalise^ 
]]

hydra({
	name = "Bufferline",
	hint = hint,
	config = {
		buffer = bufnr,
		hint = {
			border = "rounded",
			position = "middle-right",
		},
		color = "amaranth",
		invoke_on_body = true,
		on_enter = function()
			vim.cmd("silent! %foldopen!")
			vim.bo.modifiable = false
		end,
	},
	mode = { "n", "x" },
	body = "<C-w>",
	heads = {
		{ "h", "<C-w>h", { desc = "move left" } },
		{ "j", "<C-w>j", { desc = "move down" } },
		{ "k", "<C-w>k", { desc = "move up" } },
		{ "l", "<C-w>l", { desc = "move right" } },

		{ "<C-h>", function() splits.resize_left(2) end, },
		{ "<C-j>", function() splits.resize_down(2) end, },
		{ "<C-k>", function() splits.resize_up(2) end, },
		{ "<C-l>", function() splits.resize_right(2) end, },
		{ "=", "<C-w>=", { desc = "equalise" } },

		{ "q", nil, { exit = true, nowait = true, desc = "exit" } },
	},
})
