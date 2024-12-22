-- override built in plugins and extras plugins configs
return {
  { "LazyVim/LazyVim", pin = true, commit = "447e260a62ffd50b0113c20db0e63108baf44b44" },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        position = "right",
      },
      event_handlers = {
        {
          event = "file_open_requested",
          handler = function()
            -- auto close
            require("neo-tree.command").execute({ action = "close" })
          end,
        },
      },
    },
  },
}
