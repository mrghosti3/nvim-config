require("mason").setup()

require("mason-lspconfig").setup({
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

vim.diagnostic.config({
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = 'minimal',
    border = 'single',
    source = true,
    header = '',
    prefix = '',
    suffix = '',
  },
})

vim.lsp.config('*', {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  noremap = true,
  silent = true,
})

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
