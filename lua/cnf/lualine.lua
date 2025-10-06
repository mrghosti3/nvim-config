local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
end

local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    sections = { "error", "warn" },
    symbols = { error = " ", warn = " " },
    colored = false,
    update_in_insert = false,
    always_visible = true,
}

local filename = {
    "filename",
    file_status = true,     -- Displays file status (readonly status, modified status)
    newfile_status = false, -- Display new file status (new file means no write after created)
    path = 1,               -- 1: Relative path

    shorting_target = 40,   -- Shortens path to leave 40 spaces in the window
                            -- for other components. (terrible name, any suggestions?)
    symbols = {
        modified = '[+]',      -- Text to show when the file is modified.
        readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
        unnamed = '[No Name]', -- Text to show for unnamed buffers.
        newfile = '[New]',     -- Text to show for new created file before first writting
    }
}

local diff = {
    "diff",
    colored = false,
    symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
    cond = hide_in_width
}

local branch = {
    "branch",
    icons_enabled = true,
    icon = "",
    left_padding = 1
}

-- cool function for progress
-- local progress = function()
--     local current_line = vim.fn.line(".")
--     local total_lines = vim.fn.line("$")
--     local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
--     local line_ratio = current_line / total_lines
--     local index = math.ceil(line_ratio * #chars)
--     return chars[index]
-- end

local spaces = function()
    return "\\t : " .. vim.api.nvim_get_option_value(
        'shiftwidth',
        { buf = 0 }
    )
end

---@diagnostic disable-next-line
require('lualine').setup({
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = "",
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {
                "alpha", "dashboard", "NvimTree", "Outline", "Trouble", "help", "qf"
            },
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = {
            {
                'mode',
                separator = {
                    left = '',
                    right = ''
                },
            } },
        lualine_b = { branch, diff },
        lualine_c = { filename },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { spaces, diagnostics },
        lualine_z = {
            "progress",
            {
                "location",
                separator = {
                    right = ''
                },
                left_padding = 1
            }
        },
        -- lualine_z = { progress },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { filename },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = {},
})
