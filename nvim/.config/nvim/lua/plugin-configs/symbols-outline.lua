vim.g.symbols_outline = {
    highlight_hovered_item = false,
    show_numbers = true,
}

-- keymaps
local set = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

set("n", "<leader>s", ":SymbolsOutline<CR>", opts)
