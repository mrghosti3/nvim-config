local deno_path = vim.fn.expand('$HOME/.local/cargo/bin/deno')

return {
  cmd = {
    deno_path,
    'lsp'
  },
}
