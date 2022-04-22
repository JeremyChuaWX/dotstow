local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
    return
end

require('plugin-configs.lsp.handlers').setup()
require('plugin-configs.lsp.lsp-installer')
require('plugin-configs.lsp.null-ls')
require('plugin-configs.lsp.lsp-signature')
require('plugin-configs.lsp.symbols-outline')
