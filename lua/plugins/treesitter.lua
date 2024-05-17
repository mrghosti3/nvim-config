return {
    "nvim-treesitter/nvim-treesitter",
    lazy = true,
    event = { "BufReadPost" },
    cmd = {
        'TSInstall',
        'TSInstallInfo',
        'TSUpdate',
    },
    build = function()
        pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
    dependencies = {
        "hiphish/rainbow-delimiters.nvim",
        "RRethy/vim-illuminate",
    },
    config = function ()
        require("plugs.treesitter")
    end
}
