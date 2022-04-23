local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
    return
end

local lsp_kind_status_ok, lspkind = pcall(require, "lspkind")
if not lsp_kind_status_ok then
    return
end

-- require("luasnip.loaders.from_vscode").lazy_load()
-- require('luasnip').filetype_extend("javascript", { "javascriptreact" })
-- require('luasnip').filetype_extend("javascript", { "html" })

local check_back_space = function()
    local col = vim.fn.col(".") - 1
    if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
        return true
    else
        return false
    end
end

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert {
        ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ["<C-e>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        -- Accept currently selected item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(
            function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                elseif check_back_space() then
                    fallback()
                else
                    fallback()
                end
            end,
            { "i", "s" }
        ),
        ["<S-Tab>"] = cmp.mapping(
            function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end,
            { "i", "s" }
        ),
    },
    sources = {
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "path" },
        { name = "buffer" },
    },
    formatting = {
        format = lspkind.cmp_format {
            with_text = true,
            menu = {
                buffer = "[buf]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[API]",
                path = "[path]",
                luasnip = "[snip]",
            },
        },
    },
    confirm_opts = {
        behaviour = cmp.ConfirmBehavior.Replace,
        select = false,
    }
}

-- Use buffer source for `/` (if you enabled `native_menu`, this won"t work anymore).
cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline {
        ["<Tab>"] = {
            c = function()
                if cmp.visible() then
                    cmp.select_next_item()
                end
            end
        },
        ["<S-Tab>"] = {
            c = function()
                if cmp.visible() then
                    cmp.select_prev_item()
                end
            end
        },
    },
    sources = {
        { name = "buffer" }
    }
})

-- Use cmdline & path source for ":" (if you enabled `native_menu`, this won"t work anymore).
cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline {
        ["<Tab>"] = {
            c = function()
                if cmp.visible() then
                    cmp.select_next_item()
                end
            end
        },
        ["<S-Tab>"] = {
            c = function()
                if cmp.visible() then
                    cmp.select_prev_item()
                end
            end
        },
    },
    sources = {
        { name = "path" },
        { name = "cmdline" },
    },
})
