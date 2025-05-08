local luasnip = require("luasnip")
local vscode_snip = require('luasnip.loaders.from_vscode')

local options = {
  history = true,
  updateevents = "TextChanged,TextChangedI",
}

luasnip.config.set_config(options)
vscode_snip.lazy_load({
  paths = { vim.g.luasnippets_path or "" }
})

vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    local lsnip = require('luasnip')
    local session = lsnip.session
    local current_buf = vim.api.nvim_get_current_buf()

    if session.current_nodes[current_buf] and not session.jump_active
    then
      lsnip.unlink_current()
    end
  end,
})
