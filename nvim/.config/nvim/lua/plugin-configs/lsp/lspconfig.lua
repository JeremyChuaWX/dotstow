local installer_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not installer_ok then
    return
end

local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
    return
end

lsp_installer.setup()

local auto_install_server_list = {
    "sumneko_lua",
    "pyright",
    "tsserver",
    "emmet_ls",
    "jsonls",
    "jdtls",
    "tailwindcss",
}

for _, name in pairs(auto_install_server_list) do
    local server_is_found, server = lsp_installer.get_server(name)
    if server_is_found and not server:is_installed() then
        vim.notify("Installing " .. name)
        server:install()
    end
end

-- register a handler that will be called for all installed servers
-- you may also register handlers on specific server instances instead

-- TODO: how to do nothing for jdtls and continue
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

    lspconfig[server.name].setup(opts)
end

-- lsp_installer.on_server_ready(function(server)
--     local opts = {
--         on_attach = require("plugin-configs.lsp.handlers").on_attach,
--         capabilities = require("plugin-configs.lsp.handlers").capabilities,
--     }
-- 
--     if server.name == "sumneko_lua" then
--         local sumneko_opts = require("plugin-configs.lsp.settings.sumneko_lua")
--         opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
--     end
-- 
--     if server.name == "jsonls" then
--         local jsonls_opts = require("plugin-configs.lsp.settings.jsonls")
--         opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
--     end
-- 
--     if server.name == "emmet_ls" then
--         local emmet_ls_opts = require("plugin-configs.lsp.settings.emmet_ls")
--         opts = vim.tbl_deep_extend("force", emmet_ls_opts, opts)
--     end
-- 
--     if server.name == "jdtls" then
--         return
--     end
-- 
--     lspconfig[server.name].setup(opts)
-- end)
