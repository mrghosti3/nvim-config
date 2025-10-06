-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
local nvim_tree = require('nvim-tree')

-- This function has been generated from your
--   view.mappings.list
--   view.mappings.custom_only
--   remove_keymaps
--
-- You should add this function to your configuration and set on_attach = on_attach in the nvim-tree setup call.
--
-- Although care was taken to ensure correctness and completeness, your review is required.
--
-- Please check for the following issues in auto generated content:
--   "Mappings removed" is as you expect
--   "Mappings migrated" are correct
--
-- Please see https://github.com/nvim-tree/nvim-tree.lua/wiki/Migrating-To-on_attach for assistance in migrating.
--
local function my_on_attach(bufnr)
    local api = require('nvim-tree.api')
    local keymap = function(lhs, rhs, desc)
        local opts = {
            desc = 'nvim-tree: ' .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true
        }
        vim.keymap.set('n', lhs, rhs, opts)
    end

    keymap('<2-RightMouse>', api.tree.change_root_to_node,      'CD RMouse')
    keymap('<2-LeftMouse>',  api.node.open.edit,                'Open')
    keymap('<C-]>',          api.tree.change_root_to_node,      'CD')
    keymap('<C-e>',          api.node.open.replace_tree_buffer, 'Open: In Place')
    keymap('<C-k>',          api.node.show_info_popup,          'Info')
    keymap('<C-r>',          api.fs.rename_sub,                 'Rename: Omit Filename')
    keymap('<C-t>',          api.node.open.tab,                 'Open: New Tab')
    keymap('<C-v>',          api.node.open.vertical,            'Open: Vertical Split')
    keymap('<C-x>',          api.node.open.horizontal,          'Open: Horizontal Split')
    keymap('<BS>',           api.node.navigate.parent_close,    'Close Directory')
    keymap('<CR>',           api.node.open.edit,                'Open')
    keymap('<Tab>',          api.node.open.preview,             'Open Preview')
    keymap('>',              api.node.navigate.sibling.next,    'Next Sibling')
    keymap('<',              api.node.navigate.sibling.prev,    'Previous Sibling')
    keymap('.',              api.node.run.cmd,                  'Run Command')
    keymap('-',              api.tree.change_root_to_parent,    'Up')
    keymap('a',              api.fs.create,                     'Create')
    keymap('bmv',            api.marks.bulk.move,               'Move Bookmarked')
    keymap('B',              api.tree.toggle_no_buffer_filter,  'Toggle No Buffer')
    keymap('c',              api.fs.copy.node,                  'Copy')
    keymap('C',              api.tree.toggle_git_clean_filter,  'Toggle Git Clean')
    keymap('[c',             api.node.navigate.git.prev,        'Prev Git')
    keymap(']c',             api.node.navigate.git.next,        'Next Git')
    keymap('d',              api.fs.remove,                     'Delete')
    keymap('D',              api.fs.trash,                      'Trash')
    keymap('E',              api.tree.expand_all,               'Expand All')
    keymap('e',              api.fs.rename_basename,            'Rename: Basename')
    keymap(']e',             api.node.navigate.diagnostics.next,'Next Diagnostic')
    keymap('[e',             api.node.navigate.diagnostics.prev,'Prev Diagnostic')
    keymap('F',              api.live_filter.clear,             'Clean Filter')
    keymap('f',              api.live_filter.start,             'Filter')
    keymap('g?',             api.tree.toggle_help,              'Help')
    keymap('gy',             api.fs.copy.absolute_path,         'Copy Absolute Path')
    keymap('H',              api.tree.toggle_hidden_filter,     'Toggle Dotfiles')
    keymap('I',              api.tree.toggle_gitignore_filter,  'Toggle Git Ignore')
    keymap('J',              api.node.navigate.sibling.last,    'Last Sibling')
    keymap('K',              api.node.navigate.sibling.first,   'First Sibling')
    keymap('m',              api.marks.toggle,                  'Toggle Bookmark')
    keymap('o',              api.node.open.edit,                'Open')
    keymap('O',              api.node.open.no_window_picker,    'Open: No Window Picker')
    keymap('p',              api.fs.paste,                      'Paste')
    keymap('P',              api.node.navigate.parent,          'Parent Directory')
    keymap('q',              api.tree.close,                    'Close')
    keymap('r',              api.fs.rename,                     'Rename')
    keymap('R',              api.tree.reload,                   'Refresh')
    keymap('s',              api.node.run.system,               'Run System')
    keymap('S',              api.tree.search_node,              'Search')
    keymap('U',              api.tree.toggle_custom_filter,     'Toggle Hidden')
    keymap('W',              api.tree.collapse_all,             'Collapse')
    keymap('x',              api.fs.cut,                        'Cut')
    keymap('y',              api.fs.copy.filename,              'Copy Name')
    keymap('Y',              api.fs.copy.relative_path,         'Copy Relative Path')
    keymap('l',              api.node.open.edit,                'Open')
    keymap('h',              api.node.navigate.parent_close,    'Close Directory')
    keymap('v',              api.node.open.vertical,            'Open: Vertical Split')
end

nvim_tree.setup {
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = false,
    sync_root_with_cwd = true,
    diagnostics = {
        enable = true,
        icons = {
            hint = "H",
            info = "I",
            warning = "W",
            error = "E",
        },
    },
    update_focused_file = {
        enable = true,
        update_root = false,
        ignore_list = {},
    },
    git = {
        enable = true,
        ignore = false,
        timeout = 500,
    },
    on_attach = my_on_attach,
    view = {
        width = 30,
        side = "left",
        number = false,
        relativenumber = true,
    },
    renderer = {
        icons = {
            glyphs = {
                default = "",
                symlink = "",
                git = {
                    unstaged = "",
                    staged = "S",
                    unmerged = "",
                    renamed = "➜",
                    deleted = "",
                    untracked = "U",
                    ignored = "◌",
                },
                folder = {
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                },
            }
        }
    }
}
