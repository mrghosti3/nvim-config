local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("cnf.lsp.config")
require("cnf.lsp.handlers")
