local status_ok, ts = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

ts.setup({
	ensure_installed = "all",
	ignore_install = { "phpdoc" },
	highlight = {
		enable = true,
		-- additional_vim_highlighting = false,
	},
	indent = {
		enable = true,
		disable = {
			"yaml",
		},
	},
	autopairs = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})

-- folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
