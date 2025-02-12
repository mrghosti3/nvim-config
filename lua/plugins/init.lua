return {
    -- Theme
    {
        "catppuccin/nvim",
        name = "catppuccin",
        version = '^1.7.0',
        priority = 1000,
        config = function() require("cnf.colorscheme") end
    },
    {
        "NvChad/nvim-colorizer.lua",
        name = "colorizer",
        commit = '125e4995b86a94405aaf40191738f4b6fcd8ed57',
        dependencies = {
            "catppuccin"
        }
    },

    -- Extra looks
    {
        "akinsho/bufferline.nvim", -- Bufferline plugin for displaying opened buffers
        lazy = false,
        event = { "BufWinEnter" },
        dependencies = {
            "moll/vim-bbye",
            "nvim-tree/nvim-web-devicons",
        },
        config = function() require("plugs.bufferline") end
    },
    {
        "nvim-lualine/lualine.nvim",
        event = { "VeryLazy" },
        config = function() require("plugs.lualine") end
    },
    {
        "lukas-reineke/indent-blankline.nvim", -- Indentation lines
        version = "^3.6",
        lazy = true,
        event = { "BufRead" },
        main = "ibl",
        config = function() require("plugs.indent-blank") end
    },
    {
        "folke/todo-comments.nvim",
        event = { "VeryLazy" },
        dependencies = "nvim-lua/plenary.nvim",
        config = function() require("plugs.todo") end
    },

    -- QoL Utils
    {
        'nvim-telescope/telescope.nvim',
        version = "^0.1.5",
        event = { "VeryLazy", },
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        config = function() require("plugs.telescope") end
    },
    {
        "kylechui/nvim-surround", -- Shortcuts for surrounding text with () {} [] "" ''
        version = "^2.1.5",
        event = { "VeryLazy", },
        opts = {
            keymaps = {
                insert = "<C-g>s",
                insert_line = "<C-g>S",
                normal = "ys",
                normal_cur = "yss",
                normal_line = "yS",
                normal_cur_line = "ySS",
                visual = "S",
                visual_line = "gS",
                delete = "ds",
                change = "cs",
            },
        },
    },
    {
        "numToStr/Comment.nvim",
        lazy = false,
        config = function()
            require("plugs.comment")
        end
    }, -- Commenting shortcuts
    {
        "nmac427/guess-indent.nvim",
        event = { "VeryLazy" },
        opts = {
            auto_cmd = true,
            filetype_exclude = {
                "tutor",
                "netrw",
            },
            buftype_exclude = {
                "help",
                "nofile",
                "terminal",
                "prompt",
            }
        }
    },


    -- LSP
    {
        "williamboman/mason.nvim", -- enables LSP
        lazy = true,
        version = "^1.10",
        cmd = {
            "Mason",
            "MasonUpdate",
            "MasonInstall",
            "MasonUninstall",
            "MasonUninstallAll",
            "MasonLog",
        },
        config = function() require("plugs.lsp.mason_set") end
    },
    {
        "williamboman/mason-lspconfig.nvim", -- integration with nvim-lspconfig
        version = "^1.0",
        dependencies = {
            "neovim/nvim-lspconfig", -- lua integration with native LSP
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function() require("plugs.lsp.config") end
    },
    {
        "nvimtools/none-ls.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            require("plugs.lsp.null_ls")
        end
    },
    {
        "hedyhli/outline.nvim",
        lazy = true,
        cmd = "Outline",
        keys = {
            { "<leader>st", "<cmd>Outline<cr>" },
            { "<leader>sf", "<cmd>OutlineFocus<cr>" },
        },
        config = function() require("plugs.symbols") end
    },

    {
        "lewis6991/gitsigns.nvim", -- Commands and integration for Git
        version = "0.8.*",
        lazy = true,
        event = { "BufRead" },
        config = function()
            require("plugs.gitsigns")
        end
    },

    -- Deps
    {
        "nvim-lua/plenary.nvim",
        lazy = true
    },
    {
        "JoosepAlviste/nvim-ts-context-commentstring",
    }
}
