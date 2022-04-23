local lualine_ok, lualine = pcall(require, "lualine")
if not lualine_ok then
    return
end

local gps_ok, gps = pcall(require, "nvim-gps")
if not gps_ok then
    return
end

local lsp_status_ok, lsp_status = pcall(require, "lsp-status")
if not lsp_status_ok then
    return
end

lsp_status.register_progress()

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
        lualine_c = {
            "%1n:", "filename",
            { gps.get_location, cond = gps.is_available },
        },
        lualine_x = {
            function()
                return lsp_status.status_progress()
            end,
            "filetype",
        },
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
