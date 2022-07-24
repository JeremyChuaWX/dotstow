local status_ok, blankline = pcall(require, "indent_blankline")
if not status_ok then
    return
end

blankline.setup({
    char = "┃",
    show_current_context = true,
    -- show_current_context_start = true,
    show_first_indent_level = true,
    show_trailing_blackline_indent = false,
    filetype_exclude = {
        "NvimTree",
        "help",
        "neogit",
        "terminal",
        "lspinfo",
        "packer",
        "markdown",
        "txt",
        "git",
        "gitcommit",
        "TelescopePrompt",
        "packer",
        "", -- for buffers without a file type
    },
    buftype_exclude = {
        "terminal",
        "nofile",
    },
})

vim.cmd("highlight IndentBlanklineChar guifg=#3f3e3a gui=nocombine")
vim.cmd("highlight IndentBlanklineContextChar guifg=#ffbf00 gui=nocombine")
-- vim.cmd("highlight IndentBlanklineContextStart guisp=#ffbf00 gui=nocombine,underline cterm=underline")
