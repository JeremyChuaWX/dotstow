local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    return
end

local servers = {
    "sumneko_lua",
    "pyright",
    "tsserver",
    "emmet_ls",
    "jsonls",
    "jdtls",
    "tailwindcss",
}

for _, name in pairs(servers) do
    local server_is_found, server = lsp_installer.get_server(name)
    if server_is_found and not server:is_installed() then
        print("Installing " .. name)
        server:install()
    end
end

-- register a handler that will be called for all installed servers
-- you may also register handlers on specific server instances instead
lsp_installer.on_server_ready(function(server)
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

    if server.name == "jdtls" then
        return
    end

    server:setup(opts)
end)
