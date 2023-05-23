local fn = vim.fn

-- Auto install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packad packer.nvim]])
end

-- Auto reloads plugins config changes in this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Safely loads packer. On error doesn't spam with error messages.
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Make packer use popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
})

-- Installs plugins
return packer.startup(function(use)
  -- List of plugins
  use("wbthomason/packer.nvim")                       -- Have packer manage itself
  use("nvim-lua/plenary.nvim")                        -- Useful lua functions used ny lots of plugins
  use("windwp/nvim-autopairs")                        -- Autopairs, integrates with both cmp and treesitter
  use("kylechui/nvim-surround")                       -- Shortcuts for surrounding text with () {} [] "" ''
  use("numToStr/Comment.nvim")                        -- Commenting shortcuts
	use("JoosepAlviste/nvim-ts-context-commentstring")  --
  use("kyazdani42/nvim-web-devicons")                 --
  use("nvim-tree/nvim-tree.lua")                      -- Plugin for displaying FS tree
  use("akinsho/bufferline.nvim")                      -- Bufferline plugin for displaying opened buffers
  use("moll/vim-bbye")                                --
  use("lukas-reineke/indent-blankline.nvim")          -- Indentation lines
  use("nvim-lualine/lualine.nvim")                    --
  use({
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim"
  })
  -- Lua
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  }
  use('nmac427/guess-indent.nvim')
  use("simrat39/symbols-outline.nvim")
  use('lewis6991/impatient.nvim')


  -- Colorschemes
  use({ "catppuccin/nvim", as = "catppuccin" })
  use({ "NvChad/nvim-colorizer.lua", as = "colorizer" })

  -- cmp plugins
  use("hrsh7th/nvim-cmp")         -- completion plugin
  use("hrsh7th/cmp-buffer")       -- buffer completions
  use("hrsh7th/cmp-path")         -- path completions
  use("hrsh7th/cmp-cmdline")      -- cmdline completions
  use("saadparwaiz1/cmp_luasnip") -- snippet completions
  use("hrsh7th/cmp-nvim-lsp")     --
  use("hrsh7th/cmp-nvim-lua")     --

  -- snippets
  use("L3MON4D3/LuaSnip")             -- snippet engine
  use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

  -- LSP
  use("williamboman/mason.nvim")           -- enables LSP
  use("williamboman/mason-lspconfig.nvim") --
  use("neovim/nvim-lspconfig")             -- enables LSP
  use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = "nvim-lua/plenary.nvim"
  })
  use({
    "nvim-telescope/telescope.nvim", tag = '0.1.1'
  })   -- telescope fuzzy finder

  -- Treesitter
  use("nvim-treesitter/nvim-treesitter")
  use("mrjones2014/nvim-ts-rainbow")

  use("lewis6991/gitsigns.nvim") -- Commands and integration for Git
  use("RRethy/vim-illuminate")

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
