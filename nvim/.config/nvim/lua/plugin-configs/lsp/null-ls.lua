local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local actions = null_ls.builtins.code_actions

null_ls.setup {
    debug = false,
    diagnostics_format = "#{m} (#{s})",
    update_in_insert = true,
    on_attach = require("plugin-configs.lsp.handlers").on_attach,

    sources = {
        -- general
        actions.gitsigns,

        --python
        formatting.black.with({ extra_args = { "--fast" } }),
        diagnostics.flake8,

        -- js family
        formatting.prettier.with {
            extra_args = { "--no-semi" },
            extra_filetypes = { "solidity" },
        },
        diagnostics.eslint,
        actions.eslint,
    },
}
