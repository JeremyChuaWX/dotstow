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

	-- menu = {
	-- 	width = vim.api.nvim_win_get_width(0),
	-- },
})

-- keymaps
local set = function(mode, lhs, rhs)
	vim.api.nvim_set_keymap(
        mode, lhs, rhs,
        { noremap = true, silent = true }
    )
end

if vim.fn.exists(":Telescope") then
	set("n", "<leader>hh", ":Telescope harpoon marks<CR>")
else
	set("n", "<leader>hh", ":lua require'harpoon.ui'.toggle_quick_menu()<CR>")
end

set("n", "<leader>ha", ":lua require'harpoon.mark'.add_file()<CR>")

-- TODO: add mapping to a function, open_entry(i)
