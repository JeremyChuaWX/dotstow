local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
    return
end

colorizer.setup(
    {
        "*", -- highlight all filetypes, but customise others
        html = { mode = "foreground" },
        css = { css = true },
    },
    {
        names = false,
    }
)
