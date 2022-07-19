local dap_ok, dap = pcall(require, "dap")
if not dap_ok then
	return
end

local dapui_ok, dapui = pcall(require, "dapui")
if dapui_ok then
	dapui.setup()
end

-- signs
vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" })

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

-- keymaps
local set = vim.keymap.set

set("n", "<leader>b", function()
	require("dap").toggle_breakpoint()
end, { desc = "dap toggle breakpoint" })

set("n", "<F5>", function()
	require("dap").continue()
end, { desc = "dap continue" })

set("n", "<F10>", function()
	require("dap").step_over()
end, { desc = "dap step over" })

set("n", "<F11>", function()
	require("dap").step_into()
end, { desc = "dap step into" })

set("n", "<F12>", function()
	require("dap").step_out()
end, { desc = "dap step out" })

set("n", "<leader>t", function()
	require("dap").terminate()
end, { desc = "dap terminate" })
