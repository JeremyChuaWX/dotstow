local augroup = vim.api.nvim_create_augroup("user_cmds", { clear = true })

vim.api.nvim_create_autocmd("BufWinEnter", {
    group = augroup,
    desc = "Remove format options",
    callback = function()
        vim.opt.formatoptions = vim.opt.formatoptions - "c"
        vim.opt.formatoptions = vim.opt.formatoptions - "r"
        vim.opt.formatoptions = vim.opt.formatoptions - "o"
    end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    group = augroup,
    desc = "Set local indent settings for js family",
    pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.json" },
    callback = function()
        vim.bo.shiftwidth = 2
        vim.bo.tabstop = 2
        vim.bo.softtabstop = 2
    end,
})

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup,
    desc = "Highlight text after yanking",
    callback = function()
        vim.highlight.on_yank({
            higroup = "Visual",
            timeout = 200,
        })
    end,
})

-- use q to quit
vim.api.nvim_create_autocmd("FileType", {
    group = augroup,
    pattern = { "help", "man" },
    desc = "Use q to close the window",
    command = "nnoremap <buffer> q <cmd>quit<cr>",
})
