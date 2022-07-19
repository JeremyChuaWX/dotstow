vim.g.symbols_outline = {
	highlight_hovered_item = false,
	show_numbers = true,
	preview_bg_highlight = "Normal",
}

-- keymaps
local set = vim.keymap.set

set("n", "<leader>s", ":SymbolsOutline<CR>")
