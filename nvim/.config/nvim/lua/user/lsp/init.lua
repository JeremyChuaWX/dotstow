local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

require("user.lsp.handlers").setup()
require("user.lsp.lsp-setup")
require("user.lsp.null-ls")
require("user.lsp.lsp-signature")
require("user.lsp.symbols-outline")
require("user.lsp.fidget")
