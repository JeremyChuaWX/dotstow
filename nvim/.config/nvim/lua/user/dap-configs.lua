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
