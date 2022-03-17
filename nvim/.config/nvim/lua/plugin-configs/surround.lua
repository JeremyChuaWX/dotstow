local status_ok, surround = pcall(require, "surround")
if not status_ok then
    return
end

surround.setup {
    mappings_style = "surround",
    space_on_closing_char = false,
    space_on_alias = false,
    pairs = {
        nestable = { b = { "(", ")" }, s = { "[", "]" }, B = { "{", "}" }, a = { "<", ">" } },
        linear = { q = { "'", "'" }, t = { "`", "`" }, d = { '"', '"' } }
    },
}
