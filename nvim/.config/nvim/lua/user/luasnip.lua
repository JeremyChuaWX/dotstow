local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
    return
end

require("luasnip.loaders.from_vscode").lazy_load()

-- luasnip.filetype_extend("typescriptreact", { "html" })
-- luasnip.filetype_extend("javascriptreact", { "html" })

-- virtual text
local types = require("luasnip.util.types")

luasnip.config.setup({
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { "● - choice node", "ErrorMsg" } },
            },
        },
        [types.snippet] = {
            active = {
                virt_text = { { " - snippet active", "Comment" } },
            },
        },
    },
})

-- keymaps
local set = vim.keymap.set
set({ "i", "s" }, "<C-u>", function()
    if luasnip.choice_active() then
        require("luasnip.extras.select_choice")()
    end
end)
