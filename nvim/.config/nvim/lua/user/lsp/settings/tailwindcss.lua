return {
    filetypes = { "javascriptreact", "typescriptreact" },
    root_dir = require("lspconfig").util.root_pattern("tailwind.config.js", "tailwind.config.ts"),
    settings = {
        tailwindCSS = {
            validate = true,
        },
    },
}
