local status_ok, ts = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

ts.setup {
    ensure_installed = "all",
    ignore_install = { "phpdoc" },
    highlight = {
        enable = true,
        additional_vim_highlighting = true,
    },
    indent = {
        enable = true,
        disable = {
            "yaml",
            "javascriptreact",
            "typescriptreact",
        },
    },
    autopairs = {
        enable = true,
    },
    autotag = {
        enable = true,
    }
}

-- folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
