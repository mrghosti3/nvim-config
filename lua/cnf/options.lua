vim.opt.backup = false                          -- creates backup file
vim.opt.writebackup = false                     -- allows editing from other programs
vim.opt.swapfile = false                        -- creates swapfile
vim.opt.clipboard = "unnamedplus"               -- access to systems clipboard
vim.opt.cmdheight = 2                           -- more space in the neovim cmd line for messages
vim.opt.completeopt = { "menuone", "noselect" } -- for cmp
vim.opt.conceallevel = 0                        -- `` is visible in markdown files
vim.opt.fileencoding = "utf-8"                  -- file encoding
vim.opt.hlsearch = true                         -- highlight searches
vim.opt.ignorecase = true                       -- ignore case in search patterns
vim.opt.mouse = "a"                             -- allow mouse in neovim
vim.opt.pumheight = 10                          -- pop up menu height
vim.opt.showtabline = 2                         -- always shows tabs
vim.opt.showmode = false                        -- displays 'INSERT' and more
vim.opt.smartcase = true                        -- smart casing
vim.opt.smartindent = true                      -- smart indentation
vim.opt.timeoutlen = 1000                       -- time to wait for mapped completion to finish (ms)
vim.opt.updatetime = 300                        -- faster completion
vim.opt.splitbelow = true                       -- force splits below current window in horizontal split
vim.opt.splitright = true                       -- force splits right current window in vertical split
vim.opt.expandtab = true                        -- converts tab to spaces
vim.opt.shiftwidth = 4                          -- number of spaces inserted for each indentation
vim.opt.tabstop = 4                             -- insert 2 spaces for a tab
vim.opt.autoindent = true
vim.opt.cursorline = false                      -- cursor line highlight
vim.opt.number = true                           -- display line numbers
vim.opt.relativenumber = true                   -- relative line numbering
vim.opt.signcolumn = "yes"                      -- show sign column
vim.opt.numberwidth = 4                         -- set number column width
vim.opt.wrap = true                             -- display lines as one long line
vim.opt.scrolloff = 8                           -- vertical scroll padding
vim.opt.sidescrolloff = 8                       -- horizontal scroll padding
vim.opt.termguicolors = true
vim.opt.shortmess:append("c")
vim.opt.syntax = 'enable'
vim.opt.list = true
vim.opt.listchars:append("eol:$")
--vim.opt.listchars:append("space:⋅")

vim.keymap.set("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.loaded_python_provider = 0
vim.g.python3_host_prog = 'python3'
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.health = { style = 'float' }
