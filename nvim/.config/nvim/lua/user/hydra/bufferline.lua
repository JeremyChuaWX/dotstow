local hydra_status, hydra = pcall(require, "hydra")
if not hydra_status then
	return
end

local bufferline_status, bufferline = pcall(require, "bufferline")
if not bufferline_status then
	return
end

local hint = [[
Move
----
^^^_k_^^^
_h_ ^ _l_
^^^_j_^^^
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
		{ "q", nil, { exit = true, nowait = true, desc = "exit" } },
	},
})
