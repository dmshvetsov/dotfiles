-- disabled lazyvim plugins
return {
  {
    -- do not like that it opens on nvim start
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },
  {
    -- do not likea when it inserts pair of quotes befor string start or end
    -- can be fixed with config
    "echasnovski/mini.pairs",
    enabled = false,
  },
}
