require("cnf.options")
require("cnf.keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable", -- latest stable release
    "https://github.com/folke/lazy.nvim.git",
    lazypath
  })
end

vim.opt.rtp:prepend(lazypath)

-- Safely loads packer. On error doesn't spam with error messages.
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  vim.notify("Lazy plugin loader not found", vim.log.levels.WARN)
  return
end

lazy.setup('plugins')
