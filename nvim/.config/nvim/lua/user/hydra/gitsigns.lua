local hydra_status, hydra = pcall(require, "hydra")
if not hydra_status then
	return
end

local gitsigns_status, gitsigns = pcall(require, "gitsigns")
if not gitsigns_status then
	return
end

local hint = [[
_J_: next hunk    _s_: stage hunk      _B_: blame show full 
_K_: prev hunk    _S_: stage buffer    _b_: blame line 
_p_: preview hunk _u_: undo last stage _d_: show deleted 
]]

hydra({
	name = "Git",
	hint = hint,
	config = {
		buffer = bufnr,
		hint = {
			border = "rounded",
			position = "middle-right",
		},
		color = "pink",
		invoke_on_body = true,
		on_enter = function()
			vim.cmd("silent! %foldopen!")
			vim.bo.modifiable = false
		end,
	},
	mode = { "n", "x" },
	body = "<space>hg",
	heads = {
		{
			"J",
			function()
				if vim.wo.diff then
					return "]c"
				end
				vim.schedule(function()
					gitsigns.next_hunk()
				end)
				return "<Ignore>"
			end,
			{ expr = true, desc = "next hunk" },
		},
		{
			"K",
			function()
				if vim.wo.diff then
					return "[c"
				end
				vim.schedule(function()
					gitsigns.prev_hunk()
				end)
				return "<Ignore>"
			end,
			{ expr = true, desc = "prev hunk" },
		},
		{ "s", ":Gitsigns stage_hunk<CR>", { silent = true, desc = "stage hunk" } },
		{ "u", gitsigns.undo_stage_hunk, { desc = "undo last stage" } },
		{ "S", gitsigns.stage_buffer, { desc = "stage buffer" } },
		{ "p", gitsigns.preview_hunk, { desc = "preview hunk" } },
		{ "d", gitsigns.toggle_deleted, { nowait = true, desc = "toggle deleted" } },
		{ "b", gitsigns.blame_line, { desc = "blame" } },
		{
			"B",
			function()
				gitsigns.blame_line({ full = true })
			end,
			{ desc = "blame show full" },
		},
		{ "q", nil, { exit = true, nowait = true, desc = "exit" } },
	},
})
