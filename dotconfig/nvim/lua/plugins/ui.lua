return {
  { "dmshvetsov/neo-colorscheme.nvim" },
  { "embark-theme/vim" },

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
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        width = 0.98,
        height = 0.98,
        border = false,
        prompt_prefix = "> ",
        prompt_title = false,
        results_title = false,
        preview_title = false,
        layout_strategy = "flex",
        layout_config = {
          horizontal = {
            width = 0.98,
            height = 0.98,
            preview_width = 0.33,
          },
          vertical = {
            prompt_position = "top",
            width = 0.98,
            height = 0.98,
          },
        },
      },
    },
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
      popupmenu = {
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
