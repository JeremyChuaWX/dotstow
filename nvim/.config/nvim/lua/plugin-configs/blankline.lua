local status_ok, blankline = pcall(require, "indent_blankline")
if not status_ok then
  return
end

blankline.setup {
    show_current_context = true,
    show_current_context_start = true,
    show_first_indent_level = false,
    filetype_exclude = {
        "help",
        "neogit",
        "terminal",
        "lspinfo",
        "packer",
    },
    buftype_exclude = {
        "terminal",
        "nofile",
        "guihua",
    },
}
