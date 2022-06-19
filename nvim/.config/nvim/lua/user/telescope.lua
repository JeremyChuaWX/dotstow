local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

telescope.setup({
	defaults = {
		layout_config = {
			prompt_position = "top",
			horizontal = {
				preview_width = 0.55,
				results_width = 0.8,
			},
			vertical = {
				mirror = false,
			},
			width = 0.80,
			height = 0.85,
		},
		path_display = { "absolute" },
		mappings = {
			i = {
				["<C-e>"] = "close",
				["<Tab>"] = "move_selection_next",
				["<S-Tab>"] = "move_selection_previous",
			},
			n = {
				["<C-e>"] = "close",
				["<Tab>"] = "move_selection_next",
				["<S-Tab>"] = "move_selection_previous",
			},
		},
		sorting_strategy = "ascending",
	},
	file_ignore_patterns = {
		"node_modules",
		".git/",
	},
	file_sorter = require("telescope.sorters").get_fuzzy_file,
	generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case", default is "smart_case"
		},
	},
})

telescope.load_extension("fzf")