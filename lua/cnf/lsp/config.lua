local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

mason.setup()

local mason_lsp_status_ok, mason_lsp = pcall(require, "mason-lspconfig")
if not mason_lsp_status_ok then
  return
end

local lspconfig = require("lspconfig")


mason_lsp.setup({
  ensure_installed = {
    "lua_ls",
    "bashls",
    "rust_analyzer",
    "taplo",
    "clangd",
    "marksman",
    "jdtls",
  }
})

local handler_setup = {
  function(server_name)
    local opts = {
      on_attach = require("cnf.lsp.handlers").on_attach,
      capabilities = require("cnf.lsp.handlers").capabilities,
    }

    lspconfig[server_name].setup(opts)
  end,
}

local custom_confs = {
  "clangd",
  "intelephense",
  "jdtls",
  "jsonls",
  "pyright",
  "rust_analyzer",
  "lua_ls",
  "tailwindcss",
}

for _, server in pairs(custom_confs ) do
  local opts = {
    on_attach = require("cnf.lsp.handlers").on_attach,
    capabilities = require("cnf.lsp.handlers").capabilities,
  }
  local has_opts, server_opts = pcall(require, "cnf.lsp.settings."..server)
  if has_opts then
    opts = vim.tbl_deep_extend("force", opts, server_opts)
  end

  handler_setup[server] = function ()
    lspconfig[server].setup(opts)
  end
end

mason_lsp.setup_handlers(handler_setup)
