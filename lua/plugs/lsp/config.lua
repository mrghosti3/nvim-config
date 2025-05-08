require('lspconfig')
local mason_lsp = require("mason-lspconfig")
require("mason").setup()

mason_lsp.setup({
  ensure_installed = {
    "lua_ls",
    "bashls",
    "rust_analyzer",
    "taplo",
    "clangd",
    "marksman",
    "jdtls",
  },
  automatic_enable = {
    exclude = {
      "jdtls",
      "kotlin_language_server"
    }
  }
})

local default_cap = require('cmp_nvim_lsp').default_capabilities()
for _, server in ipairs(mason_lsp.get_installed_servers()) do
  local opts = {
    capabilities = default_cap,
    noremap = true,
    silent = true,
  }

  local has_opts, server_opts = pcall(require, "lsp." .. server)
  if has_opts then
    opts = vim.tbl_deep_extend('force', opts, server_opts)
  end

  vim.lsp.config(server, opts)
end

vim.api.nvim_create_autocmd("LspAttach", {
  desc = "Set LSP keymaps",
  callback = function(event)
    local opts = {
      noremap = true,
      silent = true,
      buffer = event.buf
    }
    local vlsp = vim.lsp.buf
    local vdiag = vim.diagnostic

    -- For removing default keymaps
    --[[ local keydel = vim.keymap.del ]]

    -- Set new keymaps
    local keymap = vim.keymap.set
    keymap('n', '<leader>rn', vlsp.rename, opts)
    keymap('n', 'K', vlsp.hover, opts)
    keymap('n', 'gd', vlsp.definition, opts)
    keymap('n', 'gD', vlsp.declaration, opts) -- not all LSP servers implement!
    keymap('n', 'gl', vdiag.open_float, opts)
    keymap('n', '<F2>', vlsp.signature_help, opts)
    keymap('n', '[d', vdiag.goto_next, opts)
    keymap('n', ']d', vdiag.goto_prev, opts)

    --[[ keymap('n', 'gi', "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) ]]
    --[[ keymap('n', '<leader>a', "<cmd>lua vim.lsp.buf.code_action()<CR>", opts) ]]
    --[[ keymap('n', '<leader>q', "<cmd>lua vim.diagnostic.setloclist()<CR>", opts) ]]

    keymap('n', 'gr', "<cmd>Trouble lsp_references<CR>", opts)
  end,
})
