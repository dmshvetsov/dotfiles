return {
  { "dmshvetsov/neo-colorscheme.nvim" },
  { "embark-theme/vim" },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "embark",
      icons = {
        misc = {
          dots = "..",
        },
        dap = {
          Stopped = { "st", "DiagnosticWarn", "DapStoppedLine" },
          Breakpoint = "br",
          BreakpointCondition = "bc",
          BreakpointRejected = { "er", "DiagnosticError" },
          LogPoint = "lp",
        },
        diagnostics = {
          Error = "er",
          Warn = "wr",
          Hint = "hi",
          Info = "in",
        },
        git = {
          added = "ad",
          modified = "md",
          removed = "rm",
        },
        kinds = {
          Array = " ",
          Boolean = "󰨙 ",
          Class = " ",
          Codeium = "󰘦 ",
          Color = " ",
          Control = " ",
          Collapsed = " ",
          Constant = "󰏿 ",
          Constructor = " ",
          Copilot = " ",
          Enum = " ",
          EnumMember = " ",
          Event = " ",
          Field = " ",
          File = " ",
          Folder = " ",
          Function = "󰊕 ",
          Interface = " ",
          Key = " ",
          Keyword = " ",
          Method = "󰊕 ",
          Module = " ",
          Namespace = "󰦮 ",
          Null = " ",
          Number = "󰎠 ",
          Object = " ",
          Operator = " ",
          Package = " ",
          Property = " ",
          Reference = " ",
          Snippet = " ",
          String = " ",
          Struct = "󰆼 ",
          TabNine = "󰏚 ",
          Text = " ",
          TypeParameter = " ",
          Unit = " ",
          Value = " ",
          Variable = "󰀫 ",
        },
      },
    },
  },

  {
    "fzf-lua",
  -- TODO: views does not work,
    -- opts = {
    --   { winopts = { fullscreen = true, border = "none" } },
    -- },
  },

  -- TODO: views does not work,
  -- {
  --   "folke/noice.nvim",
  --   opts = {
  --     cmdline = {
  --       enabled = false,
  --       format = {
  --         cmdline = { icon = ">" },
  --         search_down = { icon = "🔍⌄" },
  --         search_up = { icon = "🔍⌃" },
  --         filter = { icon = "$" },
  --         lua = { icon = "☾" },
  --         help = { icon = "?" },
  --       },
  --     },
  --     messages = {
  --       enabled = false,
  --     },
  --     popupmenu = {
  --       kind_icons = false,
  --       enabled = false,
  --     },
  --     inc_rename = {
  --       cmdline = {
  --         format = {
  --           IncRename = { icon = "⟳" },
  --         },
  --       },
  --     },
  --     ---@type NoiceFormatOptions
  --     format = {
  --       level = {
  --         icons = {
  --           error = "✖",
  --           warn = "▼",
  --           info = "●",
  --         },
  --       },
  --     },
  --     ---@type NoiceConfigViews
  --     views = { popupmenu = { border = { style = "none" } }, popup = { border = { style = "none" } } },
  --   },
  -- },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 800
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = {
      sections = {
        lualine_z = {},
      },
    },
  },
}
