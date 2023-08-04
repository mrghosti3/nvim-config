local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  return
end

local fmt = null_ls.builtins.formatting
--[[ local dgc = null_ls.builtins.diagnostics ]]

null_ls.setup({
  debug = false,
  sources = {
    fmt.stylua.with({ extra_args = { "--config-path", "~/.config/stylua.toml" } }),
    fmt.rustfmt,
    fmt.clang_format,
  },
})
