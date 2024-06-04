local ts_configs = require('nvim-treesitter.configs')

ts_configs.setup({
  ensure_installed = {
    'c', 'vimdoc', 'rust', 'lua', 'python',
    'html', 'javascript', 'zig', 'markdown'
  },
  sync_install = false,
  ignore_install = {},
  highlight = {
    -- false will disable the whole extension
    enable = true,
    disable = function(lang, buf)
      local disabled_langs = { 'html' }
      local max_file_size = 100 * 1024 -- 100 KB

      local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_file_size then
        return true
      end

      for _, val in ipairs(disabled_langs) do
        if val == lang then
          return true
        end
      end
    end,
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { 'yaml' } },
  rainbow = {
    enable = true,
    extented_mode = true,
    max_file_lines = nil,
  }
})
