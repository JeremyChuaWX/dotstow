local dap_ok, dap = pcall(require, "dap")

local dapui_ok, dapui = pcall(require, "dapui")
if dapui_ok then
	dapui.setup()
end

-- signs
vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" })

-- keymaps
local opts = { noremap = true, silent = true }
local set = function(mode, lhs, rhs)
	vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

set("n", "<leader>b", ":lua require('dap').toggle_breakpoint()<CR>")
set("n", "<leader>c", ":lua require('dap').continue()<CR>")
set("n", "<F2>", ":lua require('dap').step_over()<CR>")
set("n", "<F3>", ":lua require('dap').step_into()<CR>")

if dap_ok and dapui_ok then
	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close()
	end
	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close()
	end
end
