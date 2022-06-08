local dap_ok, dap = pcall(require, "dap")

local dapui_ok, dapui = pcall(require, "dapui")
if dapui_ok then
	dapui.setup()
end

-- signs
vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" })

-- keymaps
local set = vim.keymap.set

set("n", "<leader>b", function()
	require("dap").toggle_breakpoint()
end)

set("n", "<F5>", function()
	require("dap").continue()
end)

set("n", "<F10>", function()
	require("dap").step_over()
end)

set("n", "<F11>", function()
	require("dap").step_into()
end)

set("n", "<F12>", function()
	require("dap").step_out()
end)

set("n", "<leader>t", function()
	require("dap").terminate()
end)

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
