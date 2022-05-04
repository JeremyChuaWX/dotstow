local installer_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not installer_ok then
	return
end

local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
	return
end

lsp_installer.setup({
	ensure_installed = {
		"sumneko_lua",
		"pyright",
		"tsserver",
		"emmet_ls",
		"jsonls",
		"jdtls",
		"tailwindcss",
	},
    automatic_installation = true,
})

local blacklist = {
    "jdtls",
}

local function in_blacklist(name, blacklist)
    for _, check in pairs(blacklist) do
        if name == check then
            return true
        end
    end

    return false
end

-- register a handler that will be called for all installed servers
-- you may also register handlers on specific server instances instead

for _, server in pairs(lsp_installer.get_installed_servers()) do
	local opts = {
		on_attach = require("plugin-configs.lsp.handlers").on_attach,
		capabilities = require("plugin-configs.lsp.handlers").capabilities,
	}

	if server.name == "sumneko_lua" then
		local sumneko_opts = require("plugin-configs.lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	if server.name == "jsonls" then
		local jsonls_opts = require("plugin-configs.lsp.settings.jsonls")
		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	end

	if server.name == "emmet_ls" then
		local emmet_ls_opts = require("plugin-configs.lsp.settings.emmet_ls")
		opts = vim.tbl_deep_extend("force", emmet_ls_opts, opts)
	end

	if server.name == "tailwindcss" then
		local tailwindcss_opts = require("plugin-configs.lsp.settings.tailwindcss")
		opts = vim.tbl_deep_extend("force", tailwindcss_opts, opts)
	end

    if not in_blacklist(server.name, blacklist) then
        lspconfig[server.name].setup(opts)
    end
end
