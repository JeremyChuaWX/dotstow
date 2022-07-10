local set_command = vim.api.nvim_create_user_command

set_command("ReloadConfig", "source $MYVIMRC", {})
