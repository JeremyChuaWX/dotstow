local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
    return
end

bufferline.setup({
    options = {
        -- numbers = function (opts)
        --     return string.format("%s", opts.id)
        -- end,
        numbers = "none",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(_, _, diagnostics_dict, _) -- count, level, diagnostics_dict, context
            local s = " "
            for e, n in pairs(diagnostics_dict) do
                local sym = e == "error" and " " or (e == "warning" and " " or "")
                s = s .. n .. sym
            end
            return s
        end,
        offsets = {
            {
                filetype = "NvimTree",
                text = "",
                text_align = "center",
            },
            {
                filetype = "Outline",
                text = "",
                text_align = "center",
            },
        },
    },
})

-- keymaps
local set = vim.keymap.set

set("n", "L", ":BufferLineCycleNext<CR>")
set("n", "H", ":BufferLineCyclePrev<CR>")
set("n", "<leader>L", ":BufferLineMoveNext<CR>")
set("n", "<leader>H", ":BufferLineMovePrev<CR>")
