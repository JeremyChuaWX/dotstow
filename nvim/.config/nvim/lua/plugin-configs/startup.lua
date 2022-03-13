local status_ok, startup = pcall(require, "startup")
if not status_ok then
    return
end

startup.setup {
    theme = "cooltheme",
}

vim.g.startup_bookmarks = {
    ["V"] = "~/.vimrc",
    ["N"] = "~/.config/nvim/lua/plugin-configs/packer-config.lua",
    ["A"] = "~/.config/alacritty/alacritty.yml",
}
