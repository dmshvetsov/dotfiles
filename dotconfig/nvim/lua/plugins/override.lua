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
    },
  },
}
