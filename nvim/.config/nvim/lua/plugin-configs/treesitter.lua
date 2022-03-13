local status_ok, ts = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

ts.setup {
    ensure_installed = "maintained",
    highlight = {
        enable = true,
        additional_vim_highlighting = true,
    },
    indent = {
        enable = true,
        disable = {
            "yaml",
        },
    },
    autopairs = {
        enable = true,
    },
}
