local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local actions = null_ls.builtins.code_actions

null_ls.setup({
	debug = false,
	diagnostics_format = "[#{c}] #{m} (#{s})",
	update_in_insert = true,
	on_attach = function(client, bufnr)
		local formatting_fn = require("user.lsp.handlers").formatting_callback
		formatting_fn(client, bufnr)

		local attach_fn = require("user.lsp.handlers").on_attach
		attach_fn(client, bufnr)
	end,

	sources = {
		-- general
		actions.gitsigns,

		-- zsh
		diagnostics.zsh,

		-- lua
		formatting.stylua,

		--python
		formatting.black.with({
			extra_args = { "--fast" },
		}),
		diagnostics.flake8,

		-- java
		formatting.google_java_format,

		-- js family
		formatting.prettier,
		diagnostics.eslint_d.with({
			only_local = "node_modules/.bin",
		}),
	},
})
