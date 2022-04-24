local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
    return
end

require("luasnip.loaders.from_vscode").lazy_load()

luasnip.filetype_extend("typescriptreact", { "html" })
luasnip.filetype_extend("javascriptreact", { "html" })