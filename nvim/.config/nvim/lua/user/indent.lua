local status_ok, blankline = pcall(require, "indent_blankline")
if not status_ok then
    return
end

blankline.setup({
    show_current_context = true,
    show_current_context_start = true,
    show_first_indent_level = false,
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
