local M = {}

M.setup = function()
    local signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn", text = "" },
        { name = "DiagnosticSignHint", text = "" },
        { name = "DiagnosticSignInfo", text = "" },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    local diagnosticConfig = {
        virtual_text = false,
        signs = {
            active = signs,
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "single",
            source = "always",
            header = "",
            prefix = "",
        },
    }

    vim.diagnostic.config(diagnosticConfig)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "single",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "single",
    })
end

local function lsp_highlight_document(client)
    local status_ok, illuminate = pcall(require, "illuminate")
    if not status_ok then
        return
    end

    illuminate.on_attach(client)
end

local function lsp_keymaps(bufnr)
    local set = function(mode, lhs, rhs)
        vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { noremap = true, silent = true })
    end
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gf", "<cmd>lua vim.lsp.buf.formatting_sync()<CR>", opts)

    if vim.fn.exists(":Telescope") then
        set("n", "gr", "<cmd>Telescope lsp_references<CR>")
        set("n", "gd", "<cmd>Telescope lsp_definitions<CR>")
    else
        set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
        set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
    end

    set("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")
    set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
    set("n", "gR", "<cmd>lua vim.lsp.buf.rename()<CR>")
    set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>")
end

M.formatting_callback = function(client, bufnr)
    vim.keymap.set("n", "gf", function()
        local params = vim.lsp.util.make_formatting_params({})
        client.request("textDocument/formatting", params, nil, bufnr)
    end, { buffer = bufnr })
end

M.on_attach = function(client, bufnr)
    lsp_keymaps(bufnr)
    lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
