return {
    settings = {
        Lua = {
            diagnostics = {
                globals = {
                    "vim",
                    "awesome",
                    "client",
                    "root",
                    "screen",
                },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
}
