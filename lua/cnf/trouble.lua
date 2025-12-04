require("trouble").setup({
  focus = true,
  auto_refresh = false,

  -- Default definitions for Preview
  preview = {
    type = "split",
    relative = "win",
    position = "right",
    size = 0.4,
  },

  keys = { -- key mappings for actions in the trouble list
    ["?"] = "help",
    q = "close",
    ["<esc>"] = "cancel",
    r = "refresh",

    -- j = "next",
    ["}"] = "next",
    ["]]"] = "next",
    -- k = "prev",
    ["{"] = "prev",
    ["[["] = "prev",
    dd = "delete",
    d = { action = "delete", mode = "v" },

    ["<cr>"] = "jump",
    ["<tab>"] = "jump",
    ["<2-leftmouse>"] = "jump",
    o = "jump_close",
    ["<c-x>"] = "jump_split",
    ["<c-v>"] = "jump_vsplit",

    i = "inspect",
    p = "preview",
    P = "toggle_preview",

    zm = "fold_close",
    zM = "fold_close_all",
    za = "fold_toggle",
    zA = "fold_toggle_recursive",
    zr = "fold_open",
    zR = "fold_open_all",
  },

  modes = {
    doc_diagnostics = {
      mode = "diagnostics",
      auto_refresh = true,
      filter = {
        any = {
          buf = 0,
        }
      }
    },
  },
  icons = {
    indent        = {
      top         = "│ ",
      middle      = "├╴",
      last        = "└╴",
      -- last          = "-╴",
      -- last       = "╰╴", -- rounded
      fold_open   = " ",
      fold_closed = " ",
      ws          = "  ",
    }, -- icons / text used for a diagnostic
    folder_closed = " ",
    folder_open   = " ",
    kinds         = {
      Array         = " ",
      Boolean       = "󰨙 ",
      Class         = " ",
      Constant      = "󰏿 ",
      Constructor   = " ",
      Enum          = " ",
      EnumMember    = " ",
      Event         = " ",
      Field         = " ",
      File          = " ",
      Function      = "󰊕 ",
      Interface     = " ",
      Key           = " ",
      Method        = "󰊕 ",
      Module        = " ",
      Namespace     = "󰦮 ",
      Null          = " ",
      Number        = "󰎠 ",
      Object        = " ",
      Operator      = " ",
      Package       = " ",
      Property      = " ",
      String        = " ",
      Struct        = "󰆼 ",
      TypeParameter = " ",
      Variable      = "󰀫 ",
    },
  },
})
