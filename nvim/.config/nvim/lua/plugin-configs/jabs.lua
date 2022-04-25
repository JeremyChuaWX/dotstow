local status_ok, jabs = pcall(require, "jabs")
if not status_ok then
    return
end

-- local ui = vim.api.nvim_list_uis()[1]

jabs.setup {
    position = "center",
    width = 50,
    height = 10,
    border = "none",

    preview_position = "right",
    preview = {
        width = 50,
        height = 30,
        border = "single",
    },

    -- col = ui.width,
    -- row = ui.height/2,
}

-- keymaps
local set = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

set("n", "<leader>b", ":JABSOpen<CR>", opts)
