require("trouble").setup({
  auto_close = false,
  auto_open = false,
  auto_preview = true,
  auto_refresh = true,
  auto_jump = false,
  focus = true,
  restore = true,
  follow = true,
  indent_guides = true,
  max_items = 200,
  multiline = true,
  pinned = false,
  warn_no_results = true,
  open_no_results = false,

  win = {},

  -- Default definitions for Preview
  preview = {
    type = "split",
    relative = "win",
    position = "right",
    size = 0.4,
  },

  ---@type table<string, number|{ms:number, debounce?:boolean}>
  throttle = {
    refresh = 20,                            -- fetches new data when needed
    update = 10,                             -- update window
    render = 10,                             -- redner window
    follow = 100,                            -- follow current item
    preview = { ms = 100, debounce = true }, -- shows preview for current item
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
      filter = {
        any = {
          buf = 0,
        }
      }
    },
    lsp_references = {
      params = {
        include_declaration = false,
      }
    },
    lsp_base = {
      params = {
        include_current = false,
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
