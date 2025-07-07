-- disabled lazyvim builtin plugins
local disabled_plugins = {
  -- do not use the features of this plugin
  -- and changing colors when i change color scheme is time waste
  "folke/todo-comments.nvim",
  -- do not likea when it inserts pair of quotes before string start or end
  -- can be fixed with config
  "echasnovski/mini.pairs",
  -- do not use it and it takes spance and resources
  "akinsho/bufferline.nvim",
  -- do not like flash jump feature in vim search
  "folke/flash.nvim",
  -- breaks interaction with the editor in some but enough frequent cases
  "folke/noice.nvim",
  -- do not like devicons and/or nerd font combination
  -- but decidede to give a try to ascii version, see ui.lua mini.icons setup
  -- "echasnovski/mini.icons",
}

local conf = {}
for _, plugin_name in pairs(disabled_plugins) do
  table.insert(conf, {
    plugin_name,
    enabled = false,
  })
end
return conf
