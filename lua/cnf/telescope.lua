local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"

local action_utils = require("telescope.actions.utils")
local action_state = require("telescope.actions.state")

local function single_or_multi_select(prompt_bufnr)
  local current_picker = action_state.get_current_picker(prompt_bufnr)
  local has_multi_selection = (next(current_picker:get_multi_selection()) ~= nil)

  if (has_multi_selection) then
    -- apply function to each selection
    action_utils.map_selections(prompt_bufnr, function(selection)
      local filename = selection[1]
      vim.cmd(':edit! ' .. filename)
    end)
  else
    -- if does not have multi selection, open single file
    actions.file_edit(prompt_bufnr)
  end
end

telescope.setup {
  defaults = {
    prompt_prefix = "> ",
    selection_caret = "> ",
    path_display = {
      shorten = {
        len = 3,
        exclude = { 1, -1, -2, -3 }
      }
    },
    mappings = {
      i = {
        -- History keymap
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
        -- Selection movement keymap
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        -- Window keymap
        ["<esc>"] = actions.close,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,

        ["<CR>"] = single_or_multi_select,
        -- NOTE: Huh?
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-l>"] = actions.complete_tag,
        ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
      },
      n = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["H"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["L"] = actions.move_to_bottom,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["?"] = actions.which_key,
      },
    },
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
    find_files = {
      theme = "dropdown",
      find_command = { "fd", "-H", "-t", "f", "-E", ".git/" },
    },
    buffers = {
      theme = "dropdown",
    }
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  },
}

-- TELESCOPE KEYMAPS
local tbuiltin = require("telescope.builtin")
local keymap = vim.keymap.set
-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>f", tbuiltin.find_files, { desc = 'Search [F]iles' })
keymap("n", "<leader><space>", tbuiltin.buffers, { desc = 'Search Buffers' })
keymap("n", "<leader>g", tbuiltin.git_status, { desc = 'Search [G]it changes' })
keymap("n", "<leader>sg", tbuiltin.live_grep, { desc = '[S]earch by [G]rep' })
