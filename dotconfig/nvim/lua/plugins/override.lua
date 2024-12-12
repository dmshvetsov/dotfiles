-- override built in plugins and extras plugins configs
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    init = function()
      -- do nothing
    end,
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
