return {
  { "dmshvetsov/neo-colorscheme.nvim" },
  { "embark-theme/vim" },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "neo",
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
    "nvim-lualine/lualine.nvim",
    opts = { enabled = false },
  },

  {
    "folke/noice.nvim",
    opts = {
      cmdline = {
        enabled = false,
      },
      messages = {
        enabled = false,
      },
    },
  },

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
