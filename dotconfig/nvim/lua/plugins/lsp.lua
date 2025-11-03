local home_dir = vim.fn.expand("~")

-- NOTE: no need for ensure_installed, LazyVim will install everything that is mentioned in `servers = {}`
return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
      -- Be aware that you also will need to properly configure your LSP server to
      -- provide the inlay hints.
      inlay_hints = {
        enabled = false,
      },

      --
      -- Language servers configuration overrides, default configs are provided by nvim-lspconfig plugin
      --
      -- any entry in "servers" table will be instead automatically, provided configuration will be merged with the nvim-lspconfig
      --

      ---@type lspconfig.options
      servers = {
        -- disable `typos-lsp` in favour of `harper-ls` may provide duplicate or even conflicting warnings/suggestions
        -- Typos spell checker config https://github.com/tekumara/typos-lsp/blob/main/docs/neovim-lsp-config.md
        -- typos_lsp = {
        --   init_options = {
        --     diagnosticSeverity = "Hint",
        --   },
        -- },
        -- configuration docs https://writewithharper.com/docs/integrations/neovim
        -- harper_ls = {
        --   settings = {
        --     ["harper-ls"] = {
        --       linters = {
        --         SentenceCapitalization = false,
        --       },
        --     },
        --   },
        -- },
        -- end of `harper-ls` and `typos-lsp` NOTE

        tailwindcss = {},

        biome = {},

        -- Move analyzer for Sui
        -- not supported by Mason, Sui CLI + move-analyzer myst be installed manyally
        move_analyzer = {
          -- disable automatically installing the server by LazyVim and Mason
          mason = false,
          cmd = { home_dir .. "/.sui/bin/move-analyzer" },
          -- settings = {
          --   server = {
          --     path = '~/.sui/bin/move-analyzer'
          --   }
          -- }
        },

        -- Typescript (must be disbaled for Javascript projects)
        -- the same trick is done by LazyVim config
        -- vtsls = {
        --   root_dir = require("lspconfig").util.root_pattern({ "package.json", "tsconfig.json" }),
        --   single_file_support = false,
        -- },

        -- Deno
        denols = {
          root_dir = require("lspconfig").util.root_pattern({
            "deno.json",
            "deno.jsonc",
            "import_map.json",
          }),
          single_file_support = false,
          settings = {
            deno = {
              enablePaths = { "./supabase/functions" }
            }
          },
        },
      },
    },
  },
}
