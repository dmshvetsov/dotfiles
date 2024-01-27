-- disabled lazyvim builtin plugins
local disabled_plugins = {
  -- do not like that it opens on nvim start
  "nvim-neo-tree/neo-tree.nvim",
  -- do not likea when it inserts pair of quotes befor string start or end
  -- can be fixed with config
  "echasnovski/mini.pairs",
  -- do not use it and it takes spance and resources
  "akinsho/bufferline.nvim",
  -- do not like flash jump feature in vim search
  "folke/flash.nvim",
}

local conf = {}
for _, plugin_name in pairs(disabled_plugins) do
  table.insert(conf, {
    plugin_name,
    enabled = false,
  })
end
return conf
