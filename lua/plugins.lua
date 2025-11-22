return {
    -- Theme
    {
        "catppuccin/nvim",
        name = "catppuccin",
        version = '^1.9',
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
        config = function() require("cnf.bufferline") end
    },
    {
        "nvim-lualine/lualine.nvim",
        event = { "VeryLazy" },
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function() require("cnf.lualine") end
    },
    {
        "lukas-reineke/indent-blankline.nvim", -- Indentation lines
        version = "^3.9",
        main = "ibl",
        config = function() require("cnf.indent-blank") end
    },
    {
        "folke/todo-comments.nvim",
        event = { "VeryLazy" },
        dependencies = "nvim-lua/plenary.nvim",
        config = function() require("cnf.todo") end
    },

    -- QoL Utils
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        lazy = true,
        event = { 'BufReadPost' },
        cmd = {
            'TSInstall',
            'TSInstallInfo',
            'TSUpdate',
        },
        build = ':TSUpdate',
        dependencies = {
            'hiphish/rainbow-delimiters.nvim',
            'RRethy/vim-illuminate',
        },
        config = function()
            require('cnf.treesitter')
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        version = "^0.1.8",
        event = { "VeryLazy", },
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        config = function() require("cnf.telescope") end
    },
    {
        "kylechui/nvim-surround", -- Shortcuts for surrounding text with () {} [] "" ''
        version = "^3.1",
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
            require("cnf.comment")
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
    {
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
            require('cnf.nvimtree')
        end
    },
    {
        "folke/trouble.nvim",
        version = '^3.7',
        lazy = true,
        cmd = { "Trouble" },
        keys = {
            { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", },
            { "<leader>xd", "<cmd>Trouble doc_diagnostics toggle<cr>", },
            { "<leader>xw", "<cmd>Trouble todo toggle<cr>", },
            { "<leader>xc", "<cmd>Trouble close toggle<cr>", },
        },
        dependencies = "nvim-lua/plenary.nvim",
        config = function() require("cnf.trouble") end
    },

    -- LSP
    {
        "hrsh7th/nvim-cmp", -- completion plugin
        dependencies = {
            {
                "L3MON4D3/LuaSnip",
                lazy = true,
                dependencies = "rafamadriz/friendly-snippets", -- a bunch of snippets to use
                build = "make install_jsregexp",
                config = function() require("cnf.lsp.snip") end
            },
            {
                "windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
                lazy = true,
                event = { "InsertEnter" },
                config = function()
                    require("cnf.lsp.autopairs")
                end
            },
            {
                "saadparwaiz1/cmp_luasnip", -- snippet completions
                "hrsh7th/cmp-nvim-lua",     -- nvim-cmp source for neovim lua API
                "hrsh7th/cmp-nvim-lsp",     -- nvim-cmp integration with built-in LSP
                "hrsh7th/cmp-buffer",       -- buffer completions
                "hrsh7th/cmp-path",         -- path completions
                "hrsh7th/cmp-cmdline",      -- cmdline completions
            }
        },
        config = function()
            require('cnf.lsp.nvim_cmp')
        end
    },
    {
        "mason-org/mason-lspconfig.nvim", -- integration with nvim-lspconfig
        version = "^2",
        dependencies = {
            {
                {
                    "mason-org/mason.nvim", -- enables LSP
                    lazy = true,
                    version = "^2",
                    cmd = {
                        "Mason",
                        "MasonUpdate",
                        "MasonInstall",
                        "MasonUninstall",
                        "MasonUninstallAll",
                        "MasonLog",
                    },
                },
                {
                    "neovim/nvim-lspconfig", -- lua integration with native LSP
                    version = "^2"
                }
            },
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function() require("cnf.lsp.config") end
    },
    {
        "nvimtools/none-ls.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            require("cnf.lsp.null_ls")
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
        config = function() require("cnf.symbols") end
    },

    {
        "lewis6991/gitsigns.nvim", -- Commands and integration for Git
        version = "^1.0",
        lazy = true,
        event = { "BufRead" },
        config = function()
            require("cnf.gitsigns")
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
