local auto_session_status, auto_session = pcall(require, "auto-session")
if not auto_session_status then
    return
end

auto_session.setup({})

-- recommended sessionoptions
vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
