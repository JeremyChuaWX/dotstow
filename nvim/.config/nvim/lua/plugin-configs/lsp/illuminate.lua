vim.api.nvim_set_keymap('n', '<leader>i', '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>', {noremap=true})
