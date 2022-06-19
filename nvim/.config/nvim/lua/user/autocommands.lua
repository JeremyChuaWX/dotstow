local format_settings = vim.api.nvim_create_autocmd("BufWinEnter", {
	desc = "Remove format options",
	callback = function()
		vim.opt.formatoptions = vim.opt.formatoptions - "c"
		vim.opt.formatoptions = vim.opt.formatoptions - "r"
		vim.opt.formatoptions = vim.opt.formatoptions - "o"
	end,
})

local js_family_settings = vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	desc = "Set local indent settings for js family",
	pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.json" },
	callback = function()
		vim.bo.shiftwidth = 2
		vim.bo.tabstop = 2
		vim.bo.softtabstop = 2
	end,
})

-- highlight on yank
local highlight_on_yank = vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight text after yanking",
	callback = function()
		vim.highlight.on_yank({
			higroup = "Search",
			timeout = 200,
		})
	end,
})