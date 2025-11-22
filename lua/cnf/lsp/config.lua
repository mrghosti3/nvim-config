local consts = require('cnf.consts')

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

vim.lsp.config('*', {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  noremap = true,
  silent = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
  desc = "Configure buffer keymap and behavior based on LSP",
  nested = true,
  group = vim.api.nvim_create_augroup("lsp_buf_conf", { clear = true }),
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if not client then
      return
    end

    local vlsp = vim.lsp.buf
    local bufnr = event.buf

    local keymap = function (mode, lhs, rhs, opts)
      opts = opts or {}
      opts.silent = true
      opts.noremap = true
      opts.buffer = bufnr

      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- For removing default keymaps
    keymap('n', '<C-w>d', '', { nowait = true }) -- override to NOP

    -- Set new keymaps
    keymap('n', '<leader>rn', vlsp.rename, { desc = 'symbol rename' })
    keymap('n', '<leader>a', vlsp.code_action, { desc = 'LSP code action' })
    keymap('n', 'gd', vlsp.definition)
    keymap('n', '<F2>', vlsp.signature_help)
    keymap('n', 'gr', '<cmd>Trouble lsp_references<CR>', {
      desc = 'LSP references list'
    })

    keymap('n', 'K', function ()
      vlsp.hover({
        border = 'single',
        max_height = consts.max_height,
        max_width = consts.max_width,
        close_events = {
          'CursorMoved',
          'BufLeave',
          'WinLeave',
          'LspDetach'
        }
      })
    end)
  end,
})
