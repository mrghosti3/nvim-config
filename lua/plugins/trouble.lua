return {
    "folke/trouble.nvim",
    lazy = true,
    cmd = { "Trouble" },
    keys = {
        {
            "<leader>xx",
            "<cmd>TroubleToggle workspace_diagnostics<cr>",
            noremap = true,
            silent = true
        },
        { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", },
        { "<leader>xw", "<cmd>TroubleToggle todo<cr>", },
        { "<leader>xc", "<cmd>TroubleClose<cr>", },
    },
    dependencies = "nvim-lua/plenary.nvim",
    config = function() require("plugs.trouble") end
}
