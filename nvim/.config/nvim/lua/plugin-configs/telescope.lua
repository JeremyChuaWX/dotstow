local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

telescope.setup {
    defaults = {
        path_display = { "smart" },
    },
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                             -- the default case_mode is "smart_case"
        }
    }
}

telescope.load_extension("fzf")

-- keymaps
local set = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

set("n", "<leader>t", ":Telescope<CR>", opts)
set("n", "<leader>tf", ":lua require'telescope.builtin'.find_files{}<CR>", opts)
set("n", "<leader>tg", ":lua require'telescope.builtin'.live_grep{}<CR>", opts)
set("n", "<leader>tr", ":lua require'telescope.builtin'.lsp_references{}<CR>", opts)
set("n", "<leader>td", ":lua require'telescope.builtin'.lsp_definitions{}<CR>", opts)
set("n", "<leader>ti", ":lua require'telescope.builtin'.lsp_implementations{}<CR>", opts)
