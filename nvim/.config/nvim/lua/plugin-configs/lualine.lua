local lualine_ok, lualine = pcall(require, "lualine")
if not lualine_ok then
    return
end

local gps_ok, gps = pcall(require, "nvim-gps")
if not gps_ok then
    return
end

lualine.setup {
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
        lualine_b = { "diagnostics" },
        -- lualine_c = { "%1n:", "filename" },
        lualine_c = {
            "%1n:", "filename",
            { gps.get_location, cond = gps.is_available },
        },
        lualine_x = { "filetype" },
        lualine_y = { "branch", "diff" },
        lualine_z = { "%l/%L" }
    },

    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },

    tabline = {},

    extensions = {},
}
