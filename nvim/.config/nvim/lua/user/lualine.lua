local lualine_ok, lualine = pcall(require, "lualine")
if not lualine_ok then
	return
end

local hydra_colours = {
	red = { bg = "#FF5733" },
	blue = { bg = "#5EBCF6" },
	amaranth = { bg = "#ff1757" },
	teal = { bg = "#00a1a1" },
	pink = { bg = "#ff55de" },
}

lualine.setup({
	options = {
		globalstatus = true,
		icons_enabled = true,
		theme = "auto",
		-- component_separators = { left = "", right = ""},
		component_separators = "",
		-- section_separators = { left = "", right = ""},
		section_separators = "",
		disabled_filetypes = {},
		always_divide_middle = true,
	},

	-- +-------------------------------------------------+
	-- | A | B | C                             X | Y | Z |
	-- +-------------------------------------------------+

	sections = {
		lualine_a = {
			{
				"mode",
				cond = function()
					return not require("hydra.statusline").is_active()
				end,
			},
			{
				"require'hydra.statusline'.get_name()",
				fmt = string.upper,
				cond = function()
					return require("hydra.statusline").is_active()
				end,
				color = function()
					return hydra_colours[require("hydra.statusline").get_color()]
				end,
			},
		},
		lualine_b = { "diagnostics" },
		lualine_c = {
			{ "filename", path = 3, shorting_target = 100 },
		},
		lualine_x = { "filetype" },
		lualine_y = { "branch", "diff" },
		lualine_z = { "%l/%L" },
	},

	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},

	tabline = {},

	extensions = {},
})
