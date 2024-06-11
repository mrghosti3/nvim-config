return {
    "folke/trouble.nvim",
    version = '^3.4',
    lazy = true,
    cmd = { "Trouble" },
    keys = {
        { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", },
        { "<leader>xd", "<cmd>Trouble doc_diagnostics toggle<cr>", },
        { "<leader>xs", "<cmd>Trouble symbols toggle<cr>", },
        { "<leader>xw", "<cmd>Trouble todo toggle<cr>", },
        { "<leader>xq", "<cmd>Trouble qflist toggle<cr>", },
        { "<leader>xc", "<cmd>Trouble close toggle<cr>", },
    },
    dependencies = "nvim-lua/plenary.nvim",
    config = function() require("plugs.trouble") end
}
