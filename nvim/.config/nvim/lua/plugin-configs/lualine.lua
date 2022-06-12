local lualine_ok, lualine = pcall(require, "lualine")
if not lualine_ok then
	return
end

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
		lualine_a = { "mode" },
		lualine_b = {},
		lualine_c = {
			{ "filename", path = 3 },
		},
		lualine_x = {
			"filetype",
		},
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
