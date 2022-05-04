local dap_ok, dap = pcall(require, "dap")
if dap_ok then
    return
end

local dapui_ok, dapui = pcall(require, "dapui")
if dapui_ok then
    return
end

dapui.setup {
    icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  sidebar = {
    -- You can change the order of elements in the sidebar
    elements = {
      -- Provide as ID strings or tables with "id" and "size" keys
      {
        id = "scopes",
        size = 0.25, -- Can be float or integer > 1
      },
      { id = "breakpoints", size = 0.25 },
      -- { id = "stacks", size = 0.25 },
      -- { id = "watches", size = 00.25 },
    },
    size = 40,
    position = "right", -- Can be "left", "right", "top", "bottom"
  },
  tray = {
    elements = {},
    -- elements = { "repl" },
    -- size = 10,
    -- position = "bottom", -- Can be "left", "right", "top", "bottom"
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "rounded", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
}

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
local set = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

set("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
set("n", "<leader>dc", ":lua require'dap'.continue()<CR>", opts)
set("n", "<leader>dj", ":lua require'dap'.step_over()<CR>", opts)
set("n", "<leader>dk", ":lua require'dap'.step_into()<CR>", opts)
set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>", opts)
