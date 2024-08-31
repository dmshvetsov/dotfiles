local Util = require("lazyvim.util")

return {
  {
    -- to verify that the plugin works use `:checkhealth zf-native`
    "natecraddock/telescope-zf-native.nvim",
    config = function()
      Util.on_load("telescope.nvim", function()
        require("telescope").load_extension("zf-native")
      end)
    end,
  },
}
