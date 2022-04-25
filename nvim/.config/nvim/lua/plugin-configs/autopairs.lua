local pairs_status_ok, npairs = pcall(require, "nvim-autopairs")
if not pairs_status_ok then
    return
end

npairs.setup {
    check_ts = true,
    ts_config = {},
    diasble_filetype = {
        "TelescopePrompt",
        "guihua",
    }
}
