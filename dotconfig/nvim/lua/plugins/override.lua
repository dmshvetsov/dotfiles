-- override built in plugins and extras plugins configs
return {
  { "LazyVim/LazyVim", commit = "d0c366e4d861b848bdc710696d5311dca2c6d540" },
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
