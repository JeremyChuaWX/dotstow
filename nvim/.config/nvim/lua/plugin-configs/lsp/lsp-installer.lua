local status_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not status_ok then
    return
end

-- register a handler that will be called for all installed servers
-- you may also register handlers on specific server instances instead
lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = require('plugin-configs.lsp.handlers').on_attach,
        capabilities = require('plugin-configs.lsp.handlers').capabilities,
    }

    if server.name == 'sumneko_lua' then
        local sumneko_opts = require('plugin-configs.lsp.settings.sumneko_lua')
        opts = vim.tbl_deep_extend('force', sumneko_opts, opts)
    end

    if server.name == "jdtls" then
        return
    end

    server:setup(opts)
end)
