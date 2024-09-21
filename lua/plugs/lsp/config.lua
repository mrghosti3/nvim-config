local mason_lsp = require("mason-lspconfig")
local lspconfig = require("lspconfig")

local handler_setup = {
  function(server_name)
    local opts = {
      on_attach = require("plugs.lsp.handlers").on_attach,
      capabilities = require("plugs.lsp.handlers").capabilities,
    }

    lspconfig[server_name].setup(opts)
  end,
}

local custom_confs = {
  "clangd",
  "rust_analyzer",
  "intelephense",
  "jdtls",
  "kotlin_language_server",
  "jsonls",
  "pyright",
  "lua_ls",
  "tailwindcss",
}

for _, server in pairs(custom_confs) do
  local opts = {
    on_attach = require("plugs.lsp.handlers").on_attach,
    capabilities = require("plugs.lsp.handlers").capabilities,
  }
  local has_opts, server_opts = pcall(require, "serv-conf."..server)
  if has_opts then
    opts = vim.tbl_deep_extend("force", opts, server_opts)
  end

  handler_setup[server] = function ()
    lspconfig[server].setup(opts)
  end
end

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

  handlers = handler_setup,
})
