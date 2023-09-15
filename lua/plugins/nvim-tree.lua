return {
    "nvim-tree/nvim-tree.lua", -- Plugin for displaying FS tree
    lazy = true,
    event = { "VeryLazy" },
    cmd = {
        "NvimTreeToggle",
        "NvimTreeFocus",
        "NvimTreeCollapse",
    },
    keys = {
        {
            "<leader>e",
            "<cmd>NvimTreeToggle<cr>",
            desc = 'NvimTree toggle',
            noremap = true,
            silent = true
        }
    },
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require('plugs.nvimtree')
    end
}
