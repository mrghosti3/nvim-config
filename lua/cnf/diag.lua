local consts = require('cnf.consts')
local diag = vim.diagnostic
local api = vim.api

diag.config({
  underline = true,
  virtual_text = false,
  virtual_lines = false,
  severity_sort = true,
  float = {
    source = true,
    header = consts.diagnostics,
    prefix = ' ',
    border = 'single',
    max_height = 10,
    max_width = consts.float_max_width,
  },
})

-- automatically show diagnostic in float win for current line
api.nvim_create_autocmd("CursorHold", {
  pattern = "*",
  callback = function()
    if #vim.diagnostic.get(0) == 0 then
      return
    end

    if not vim.b.diagnostics_pos then
      vim.b.diagnostics_pos = { nil, nil }
    end

    local cursor_pos = api.nvim_win_get_cursor(0)

    if not vim.deep_equal(cursor_pos, vim.b.diagnostics_pos) then
      diag.open_float({})
    end

    vim.b.diagnostics_pos = cursor_pos
  end,
})
