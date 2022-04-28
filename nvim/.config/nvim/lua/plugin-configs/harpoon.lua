local status_ok, harpoon = pcall(require, "harpoon")
if not status_ok then
	return
end

harpoon.setup({
	-- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
	save_on_toggle = false,

	-- saves the harpoon file upon every change. disabling is unrecommended.
	save_on_change = true,

	-- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
	enter_on_sendcmd = false,

	-- closes any tmux windows harpoon that harpoon creates when you close Neovim.
	tmux_autoclose_windows = false,

	-- filetypes that you want to prevent from adding to the harpoon list menu.
	excluded_filetypes = { "harpoon" },

	-- set marks specific to each git branch inside git repository
	mark_branch = false,

	menu = {
		width = vim.api.nvim_win_get_width(0),
	},
})

-- keymaps
local opts = { noremap = true, silent = true }
local set = function(mode, lhs, rhs)
	vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

if vim.fn.exists(":Telescope") then
	set("n", "hh", ":Telescope harpoon marks<CR>")
else
	set("n", "hh", ":lua require'harpoon.ui'.toggle_quick_menu()<CR>")
end

set("n", "ha", ":lua require'harpoon.mark'.add_file()<CR>")

local harpoon_mappings = vim.api.nvim_create_augroup("harpoon_mappings", { clear = true })
local harpoon_next_entry = vim.api.nvim_create_autocmd("BufEnter", {
	group = "harpoon_mappings",
	pattern = "harpoon",
	desc = "Use j and k in harpoon menu",
	callback = function()
		set("n", "j", ":lua require('harpoon.ui').nav_next()<CR>")
		set("n", "k", ":lua require('harpoon.ui').nav_prev()<CR>")
	end,
})

local harpoon_clear_mappings = vim.api.nvim_create_autocmd("BufDelete", {
	group = "harpoon_mappings",
	pattern = "harpoon",
	desc = "Clear mapping after closing harpoon menu",
	callback = function()
		vim.api.nvim_del_keymap("n", "j")
		vim.api.nvim_del_keymap("n", "k")
	end,
})

-- TODO: add mapping to a function, open_entry(i)
