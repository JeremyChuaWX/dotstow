local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

telescope.setup({
    defaults = {
        initial_mode = "insert",
        layout_config = {
            prompt_position = "top",
            horizontal = {
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                mirror = false,
            },
            width = 0.80,
            height = 0.85,
        },
        path_display = { "absolute" },
        mappings = {
            i = {
                ["<esc>"] = "close",
                ["<Tab>"] = "move_selection_next",
                ["<S-Tab>"] = "move_selection_previous",
            },
            n = {
                ["<esc>"] = "close",
                ["<Tab>"] = "move_selection_next",
                ["<S-Tab>"] = "move_selection_previous",
            },
        },
        sorting_strategy = "ascending",
    },

    file_ignore_patterns = {
        "node_modules",
        ".git/",
    },

    file_sorter = require("telescope.sorters").get_fuzzy_file,
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,

    pickers = {
        git_status = {
            initial_mode = "normal",
            mappings = {
                i = {
                    ["<C-e>"] = "close",
                    ["<Tab>"] = "move_selection_next",
                    ["<S-Tab>"] = "move_selection_previous",
                },
                n = {
                    ["s"] = "git_staging_toggle",
                    ["<C-e>"] = "close",
                    ["<Tab>"] = "move_selection_next",
                    ["<S-Tab>"] = "move_selection_previous",
                },
            },
        },
    },

    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case", default is "smart_case"
        },
    },
})

telescope.load_extension("fzf")

-- keymaps
local set = vim.keymap.set

set("n", "tt", ":Telescope<CR>")

set("n", "tf", function()
    require("telescope.builtin").find_files({})
end, { desc = "telescope find files" })

set("n", "tg", function()
    require("telescope.builtin").live_grep({})
end, { desc = "telescope live grep" })

set("n", "th", function()
    require("telescope.builtin").help_tags({})
end, { desc = "telescope help tags" })

set("n", "tb", function()
    require("telescope.builtin").current_buffer_fuzzy_find({})
end, { desc = "telescope fuzzy find current buffer" })

set("n", "tB", function()
    require("telescope.builtin").buffers({})
end, { desc = "telescope buffers" })

set("n", "ts", function()
    require("telescope.builtin").git_status({})
end, { desc = "telescope git status" })

set("n", "td", function()
    require("telescope.builtin").diagnostics({})
end, { desc = "telescope diagnostics" })
