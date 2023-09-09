return {
    "hrsh7th/nvim-cmp", -- completion plugin
    event = "InsertEnter",
    lazy = true,
    dependencies = {
        {
            "L3MON4D3/LuaSnip",
            lazy = true,
            dependencies = "rafamadriz/friendly-snippets", -- a bunch of snippets to use
            config = function() require("plugs.lsp.luasnip") end
        },
        {
            "windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
            lazy = true,
            event = { "InsertEnter" },
            config = function ()
                require("plugs.lsp.autopairs")
            end
        },
        {
            "saadparwaiz1/cmp_luasnip",  -- snippet completions
            "hrsh7th/cmp-nvim-lua",      -- nvim-cmp source for neovim lua API
            "hrsh7th/cmp-nvim-lsp",      -- nvim-cmp integration with built-in LSP
            "hrsh7th/cmp-buffer",        -- buffer completions
            "hrsh7th/cmp-path",          -- path completions
            "hrsh7th/cmp-cmdline",       -- cmdline completions
        }
    },
    config = function()
        require('plugs.lsp.cmp')
    end
}
