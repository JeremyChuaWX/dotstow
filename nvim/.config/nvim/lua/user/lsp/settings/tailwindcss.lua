return {
	filetypes = { "javascriptreact", "typescriptreact" },
	root_dir = require("lspconfig").util.find_package_json_ancestor("tailwind.config.js", "tailwind.config.ts"),
	settings = {
		tailwindCSS = {
			validate = true,
		},
	},
}
