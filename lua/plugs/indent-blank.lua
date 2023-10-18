local highlight = {
    "BlanklineRed",
    "BlanklineYellow",
    "BlanklineBlue",
    "BlanklineOrange",
    "BlanklineGreen",
    "BlanklineViolet",
    "BlanklineCyan",
}

local hooks = require("ibl.hooks")
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "BlanklineRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "BlanklineYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "BlanklineBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "BlanklineOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "BlanklineGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "BlanklineViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "BlanklineCyan", { fg = "#56B6C2" })
end)

require("ibl").setup({
    debounce = 300,
    scope = {
        show_start = false
    },
    indent = {
        highlight = highlight
    }
})
