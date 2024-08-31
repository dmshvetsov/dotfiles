return {
  {
    "David-Kunz/gen.nvim",
    opts = {
      model = "llama3.1:8b",
    },
    keys = {
      {
        "<leader>cg",
        ":Gen<CR>",
        desc = "ollama generate code",
        mode = { "n", "v" },
      },
    },
  },
  -- ALTERNATIVE 
  -- {
  --  'jpmcb/nvim-llama'
  -- }
  -- ALTERNATIVE ollama.nvim
  -- {
  --   "nomnivore/ollama.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --   },
  --   -- all the user commands added by the plugin
  --   cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },
  --
  --   keys = {
  --     -- sample keybind for prompt menu. Note that the <c-u> is important for selections to work properly.
  --     {
  --       "<leader>cp",
  --       ":<c-u>lua require('ollama').prompt()<cr>",
  --       desc = "ollama prompt",
  --       mode = { "n", "v" },
  --     },
  --
  --     -- sample keybind for direct prompting. Note that the <c-u> is important for selections to work properly.
  --     {
  --       "<leader>cg",
  --       ":<c-u>lua require('ollama').prompt('Generate_Code')<cr>",
  --       desc = "ollama Generate Code",
  --       mode = { "n", "v" },
  --     },
  --   },
  --
  --   -- generate list of 3 values
  --
  --   -- configuration overrides
  --   opts = {
  --     model = "dolphin-mixtral",
  --   },
  -- },
}
