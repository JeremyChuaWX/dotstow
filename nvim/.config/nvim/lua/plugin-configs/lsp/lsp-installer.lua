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

    -- if server.name == "tsserver" then
    --     local typescript_ok, typescript = pcall(require, "typescript")
    --     if typescript_ok then
    --         -- jose-elias-alvarez/typescript.nvim setup
    --         typescript.setup {
    --             disable_commands = false, -- prevent the plugin from creating Vim commands
    --             disable_formatting = true, -- disable tsserver's formatting capabilities
    --             debug = false, -- enable debug logging for commands
    --             server = opts -- pass options to lspconfig's setup method
    --         }

    --         -- keybindings for new functionality from typescript.nvim
    --         local key_opts = { noremap = true, silent = true }
    --         vim.keymap.set("n", "<leader>ti", function() require("typescript").addMissingImports() end, key_opts)
    --         vim.keymap.set("n", "<leader>to", function() require("typescript").organizeImports() end, key_opts)
    --         vim.keymap.set("n", "<leader>tr", function() require("typescript").removeUnused() end, key_opts)
    --         vim.keymap.set("n", "<leader>tf", function() require("typescript").fixAll() end, key_opts)
    --     end

    --     return
    -- end

    server:setup(opts)
end)
