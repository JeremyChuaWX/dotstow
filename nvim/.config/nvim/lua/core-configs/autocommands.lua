-- general settings
local general_settings = vim.api.nvim_create_augroup("general", { clear = true })
local format_settings = vim.api.nvim_create_autocmd(
    "BufWinEnter",
    {
        desc = "Remove format options",
        group = general_settings,
        callback = function()
            vim.opt.formatoptions = vim.opt.formatoptions - "c"
            vim.opt.formatoptions = vim.opt.formatoptions - "r"
            vim.opt.formatoptions = vim.opt.formatoptions - "o"
        end,
    }
)

-- highlight on yank
local highlight_on_yank = vim.api.nvim_create_autocmd(
    "TextYankPost",
    {
        desc = "Highlight text after yanking",
        callback = function ()
            vim.highlight.on_yank({
                higroup = "Search",
                timeout = 200
            })
        end,
    }
)
