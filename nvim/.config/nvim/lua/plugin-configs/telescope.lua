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
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case", default is "smart_case"
        }
    }
}

telescope.load_extension("fzf")

-- keymaps
local set = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

set("n", "tt", ":Telescope<CR>", opts)
set("n", "tf", ":lua require'telescope.builtin'.find_files{}<CR>", opts)
set("n", "tg", ":lua require'telescope.builtin'.live_grep{}<CR>", opts)
set("n", "tr", ":lua require'telescope.builtin'.lsp_references{}<CR>", opts)
-- set("n", "td", ":lua require'telescope.builtin'.lsp_definitions{}<CR>", opts)
set("n", "ts", ":lua require'telescope.builtin'.lsp_document_symbols{}<CR>", opts)
set("n", "ta", ":lua require'telescope.builtin'.lsp_code_actions{}<CR>", opts)
set("n", "th", ":lua require'telescope.builtin'.help_tags{}<CR>", opts)
