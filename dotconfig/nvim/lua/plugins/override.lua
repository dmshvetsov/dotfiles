-- override built in plugins and extras plugins configs
return {
  { "LazyVim/LazyVim", commit = "25abbf546d564dc484cf903804661ba12de45507" },
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
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      indent = { enable = false },
    },
  },
}
