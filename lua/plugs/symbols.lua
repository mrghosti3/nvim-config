require("outline").setup({
    outline_window = {
        -- Where to open the split window: right/left
        position = 'right',
        -- The default split commands used are 'topleft vs' and 'botright vs'
        -- depending on `position`. You can change this by providing your own
        -- `split_command`.
        -- `position` will not be considered if `split_command` is non-nil.
        -- This should be a valid vim command used for opening the split for the
        -- outline window. Eg, 'rightbelow vsplit'.
        split_command = nil,

        -- Percentage or integer of columns
        width = 25,
        -- Whether width is relative to the total width of nvim
        -- When relative_width = true, this means take 25% of the total
        -- screen width for outline window.
        relative_width = true,

        -- Auto close the outline window if goto_location is triggered and not for
        -- peek_location
        auto_close = false,
        -- Automatically scroll to the location in code when navigating outline window.
        auto_jump = false,
        -- boolean or integer for milliseconds duration to apply a temporary highlight
        -- when jumping. false to disable.
        jump_highlight_duration = 300,
        -- Whether to center the cursor line vertically in the screen when
        -- jumping/focusing. Executes zz.
        center_on_jump = true,

        -- Vim options for the outline window
        show_numbers = true,
        show_relative_numbers = true,
        wrap = false,

        -- true/false/'focus_in_outline'/'focus_in_code'.
        -- The last two means only show cursorline when the focus is in outline/code.
        -- 'focus_in_outline' can be used if the outline_items.auto_set_cursor
        -- operations are too distracting due to visual contrast caused by cursorline.
        show_cursorline = true,
        -- Enable this only if you enabled cursorline so your cursor color can
        -- blend with the cursorline, in effect, as if your cursor is hidden
        -- in the outline window.
        -- This makes your line of cursor have the same color as if the cursor
        -- wasn't focused on the outline window.
        -- This feature is experimental.
        hide_cursor = false,

        -- Whether to auto-focus on the outline window when it is opened.
        -- Set to false to *always* retain focus on your previous buffer when opening
        -- outline.
        -- If you enable this you can still use bangs in :Outline! or :OutlineOpen! to
        -- retain focus on your code. If this is false, retaining focus will be
        -- enforced for :Outline/:OutlineOpen and you will not be able to have the
        -- other behaviour.
        focus_on_open = true,
        -- Winhighlight option for outline window.
        -- See :help 'winhl'
        -- To change background color to "CustomHl" for example, use "Normal:CustomHl".
        winhl = '',
    },
    outline_items = {
        -- Show extra details with the symbols (lsp dependent) as virtual next
        show_symbol_details = true,
        -- Show corresponding line numbers of each symbol on the left column as
        -- virtual text, for quick navigation when not focused on outline.
        -- Why? See this comment:
        -- https://github.com/simrat39/symbols-outline.nvim/issues/212#issuecomment-1793503563
        show_symbol_lineno = false,
        -- Whether to highlight the currently hovered symbol and all direct parents
        highlight_hovered_item = true,
        -- Whether to automatically set cursor location in outline to match
        -- location in code when focus is in code. If disabled you can use
        -- `:OutlineFollow[!]` from any window or `<C-g>` from outline window to
        -- trigger this manually.
        auto_set_cursor = true,
        -- Autocmd events to automatically trigger these operations.
        auto_update_events = {
            -- Includes both setting of cursor and highlighting of hovered item.
            -- The above two options are respected.
            -- This can be triggered manually through `follow_cursor` lua API,
            -- :OutlineFollow command, or <C-g>.
            follow = { 'CursorMoved' },
            -- Re-request symbols from the provider.
            -- This can be triggered manually through `refresh_outline` lua API, or
            -- :OutlineRefresh command.
            items = { 'InsertLeave', 'WinEnter', 'BufEnter', 'BufWinEnter', 'TabEnter', 'BufWritePost' },
        },
    },
    guides = {
        enabled = true,
        markers = {
            -- It is recommended for bottom and middle markers to use the same number
            -- of characters to align all child nodes vertically.
            bottom = '└',
            middle = '├',
            vertical = '│',
        },
    },
    preview_window = {
        -- Automatically open preview of code location when navigating outline window
        auto_preview = false,
        -- Automatically open hover_symbol when opening preview (see keymaps for
        -- hover_symbol).
        -- If you disable this you can still open hover_symbol using your keymap
        -- below.
        open_hover_on_preview = false,
        width = 50,     -- Percentage or integer of columns
        min_width = 50, -- This is the number of columns
        -- Whether width is relative to the total width of nvim.
        -- When relative_width = true, this means take 50% of the total
        -- screen width for preview window, ensure the result width is at least 50
        -- characters wide.
        relative_width = true,
        -- Border option for floating preview window.
        -- Options include: single/double/rounded/solid/shadow or an array of border
        -- characters.
        -- See :help nvim_open_win() and search for "border" option.
        border = 'single',
        -- winhl options for the preview window, see ':h winhl'
        winhl = 'NormalFloat:',
        -- Pseudo-transparency of the preview window, see ':h winblend'
        winblend = 0,
        -- Experimental feature that let's you edit the source content live
        -- in the preview window. Like VS Code's "peek editor".
        live = false
    }, -- These keymaps can be a string or a table for multiple keys.
    -- Set to `{}` to disable. (Using 'nil' will fallback to default keys)
    keymaps = {
        show_help = '?',
        close = "<Esc>",
        goto_location = "<Cr>",
        focus_location = "o",
        goto_and_close = '<S-Cr>',
        restore_location = '<C-g>',
        hover_symbol = "K",
        toggle_preview = "<C-Space>",
        rename_symbol = "r",
        code_actions = "a",
        fold = "h",
        unfold = "l",
        fold_toggle = '<Tab>',
        fold_toggle_all = '<S-Tab>',
        fold_all = "W",
        unfold_all = "E",
        fold_reset = "R",
        -- Move down/up by one line and peek_location immediately.
        -- You can also use outline_window.auto_jump=true to do this for any
        -- j/k/<down>/<up>.
        down_and_jump = '<C-j>',
        up_and_jump = '<C-k>',
    },
    providers = {
        priority = { 'lsp', 'markdown' },
        lsp = {
            blacklist_clients = {}
        }
    },
    symbols = {
        blacklist = {},
        icons = {
            File = { icon = "", hl = "TSURI" },
            Module = { icon = "", hl = "TSNamespace" },
            Namespace = { icon = "", hl = "TSNamespace" },
            Package = { icon = "", hl = "TSNamespace" },
            Class = { icon = "𝓒", hl = "TSType" },
            Method = { icon = "ƒ", hl = "TSMethod" },
            Property = { icon = "", hl = "TSMethod" },
            Field = { icon = "", hl = "TSField" },
            Constructor = { icon = "", hl = "TSConstructor" },
            Enum = { icon = "ℰ", hl = "TSType" },
            Interface = { icon = "ﰮ", hl = "TSType" },
            Function = { icon = "", hl = "TSFunction" },
            Variable = { icon = "", hl = "TSConstant" },
            Constant = { icon = "", hl = "TSConstant" },
            String = { icon = "𝓐", hl = "TSString" },
            Number = { icon = "#", hl = "TSNumber" },
            Boolean = { icon = "⊨", hl = "TSBoolean" },
            Array = { icon = "", hl = "TSConstant" },
            Object = { icon = "⦿", hl = "TSType" },
            Key = { icon = "🔐", hl = "TSType" },
            Null = { icon = "NULL", hl = "TSType" },
            EnumMember = { icon = "", hl = "TSField" },
            Struct = { icon = "𝓢", hl = "TSType" },
            Event = { icon = "🗲", hl = "TSType" },
            Operator = { icon = "+", hl = "TSOperator" },
            TypeParameter = { icon = "𝙏", hl = "TSParameter" }
        },
    }
})
