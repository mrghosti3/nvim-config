local cmp_status_ok, dap = pcall(require, "dap")
if not cmp_status_ok then
  return
end

-- DEBUGGING KEYMAPS
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "F5", ":lua require'dap'.continue()<cr>", opts)
keymap("n", "F10", ":lua require'dap'.step_over()<cr>", opts)
keymap("n", "F11", ":lua require'dap'.step_into()<cr>", opts)
keymap("n", "F12", ":lua require'dap'.step_out()<cr>", opts)
keymap("n", "<C-B>", ":lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<S-B>", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", opts)
keymap("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>", opts)
keymap("n", "<leader>dr", ":lua require'dap'.repl.open()<cr>", opts)
keymap("n", "<leader>dl", ":lua require'dap'.run_last()<cr>", opts)

local status_mason_dap_ok, masondap = pcall(require, "mason-nvim-dap")
if not status_mason_dap_ok then
  return
end

masondap.setup({
  ensure_installed = { "rust" },
  automatic_setup = true,
})

masondap.setup_handlers({
  function (src_name)
    -- all sources with no handler get passed here
    -- Keep original functionality of `automatic_setup = true`
    require('mason-nvim-dap.automatic_setup')(src_name)
  end
})
