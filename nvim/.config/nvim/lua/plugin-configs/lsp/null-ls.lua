local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local actions = null_ls.builtins.code_actions

null_ls.setup {
    debug = false,
    sources = {
        -- general
        actions.gitsigns,

        --python
        formatting.black.with({ extra_args = { "--fast" } }),

        -- js family
        formatting.prettier.with {
            extra_args = { "--no-semi" },
            extra_filetypes = { "solidity" },
        },
    },
}
