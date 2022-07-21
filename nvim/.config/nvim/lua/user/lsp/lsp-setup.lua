local installer_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not installer_ok then
    return
end

local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
    return
end

local functions = require("user.functions")

lsp_installer.setup({
    ensure_installed = {
        "sumneko_lua",
        "tsserver",
        "jsonls",
        "jdtls",
        "solidity_ls",
        "tailwindcss",
        "prismals",
    },
})

local blacklist_servers = {
    "jdtls",
    "tsserver",
}

for _, server in pairs(lsp_installer.get_installed_servers()) do
    local opts = {
        on_attach = require("user.lsp.handlers").on_attach,
        capabilities = require("user.lsp.handlers").capabilities,
    }

    if server.name == "sumneko_lua" then
        local sumneko_opts = require("user.lsp.settings.sumneko_lua")
        opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    end

    if server.name == "jsonls" then
        local jsonls_opts = require("user.lsp.settings.jsonls")
        opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
    end

    if server.name == "emmet_ls" then
        local emmet_ls_opts = require("user.lsp.settings.emmet_ls")
        opts = vim.tbl_deep_extend("force", emmet_ls_opts, opts)
    end

    if server.name == "tailwindcss" then
        local tailwindcss_opts = require("user.lsp.settings.tailwindcss")
        opts = vim.tbl_deep_extend("force", tailwindcss_opts, opts)
    end

    if server.name == "solidity_ls" then
        local solidity_ls_opts = require("user.lsp.settings.solidity_ls")
        opts = vim.tbl_deep_extend("force", solidity_ls_opts, opts)
    end

    if server.name == "solc" then
        local solc_opts = require("user.lsp.settings.solc")
        opts = vim.tbl_deep_extend("force", solc_opts, opts)
    end

    if server.name == "tsserver" then
        local typescript_ok, typescript = pcall(require, "typescript")
        if typescript_ok then
            typescript.setup({
                server = opts,
            })
        end
    end

    if not functions.in_list(server.name, blacklist_servers) then
        lspconfig[server.name].setup(opts)
    end
end
