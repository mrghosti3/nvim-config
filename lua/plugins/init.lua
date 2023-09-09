return {
    -- Theme
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function() require("cnf.colorscheme") end
    },
    {
        "NvChad/nvim-colorizer.lua",
        name = "colorizer",
        commit = '125e4995b86a94405aaf40191738f4b6fcd8ed57',
        dependencies = "catppuccin/nvim",
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
        event = "VeryLazy",
        config = function() require("plugs.lualine") end
    },
    {
        "lukas-reineke/indent-blankline.nvim", -- Indentation lines
        lazy = true,
        event = { "BufRead" },
        opts = {
            show_current_context = false,
            show_current_context_start = true,
            show_end_of_line = true
        }
    },
    {
        "folke/todo-comments.nvim",
        event = "VeryLazy",
        dependencies = "nvim-lua/plenary.nvim",
        config = function() require("plugs.todo") end
    },

    -- QoL Utils
    {
        'nvim-telescope/telescope.nvim',
        event = "VeryLazy",
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        config = function() require("plugs.telescope") end
    },
    {
        "kylechui/nvim-surround", -- Shortcuts for surrounding text with () {} [] "" ''
        event = "VeryLazy",
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
        event = "VeryLazy",
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
        "williamboman/mason-lspconfig.nvim", -- mason.nvim integration with nvim-lspconfig
        lazy = true,
        event = { "BufRead", "BufNewFile", "BufAdd" },
        keys = {
            "gd", "gD", "K", "gi", "<F2>", "[d", "gl", "]d",
            "<leader>q", "<leader>rn", "<leader>a",
        },
        dependencies = {
            {
                "neovim/nvim-lspconfig", -- lua integration with native LSP
                lazy = true,
                event = { "BufReadPost", "BufNewFile" },
                cmd = { "LspInfo", "LspInstall", "LspUninstall", "LspStart" },
            },
            "williamboman/mason.nvim",
        },
        config = function() require("plugs.lsp.config") end
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = "nvim-lua/plenary.nvim"
    },
    {
        "simrat39/symbols-outline.nvim",
        lazy = true,
        cmd = "SymbolsOutline",
        keys = {
            { "<leader>sf", "<cmd>SymbolsOutline<cr>" }
        },
        config = function() require("plugs.symbols") end
    },

    {
        "lewis6991/gitsigns.nvim", -- Commands and integration for Git
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
}
