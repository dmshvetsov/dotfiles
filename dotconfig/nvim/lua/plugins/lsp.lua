local function is_deno_project()
  local cwd = vim.fn.getcwd()
  return vim.fn.filereadable(cwd .. "/deno.json") == 1 or vim.fn.filereadable(cwd .. "/deno.jsonc") == 1
end

return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "move-analyzer",
        "typos-lsp",
        "harper-ls",
        "tailwindcss-language-server",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
      -- Be aware that you also will need to properly configure your LSP server to
      -- provide the inlay hints.
      inlay_hints = {
        enabled = false,
      },
      servers = {
        -- NOTE: `harper-ls` and `typos-lsp` may provide duplicate or even conflicting warnings/suggestions
        -- Typos spell checker config https://github.com/tekumara/typos-lsp/blob/main/docs/neovim-lsp-config.md
        typos_lsp = {
          init_options = {
            diagnosticSeverity = "Hint",
          },
        },
        -- configuration docs https://writewithharper.com/docs/integrations/neovim
        harper_ls = {
          settings = {
            ["harper-ls"] = {
              linters = {
                SentenceCapitalization = false,
              },
            },
          },
        },
        -- end of `harper-ls` and `typos-lsp` NOTE
        vtsls = {
          enabled = not is_deno_project(),
        },
        -- Deno
        denols = {
          enabled = is_deno_project(),
        },
      },
    },
  },
}
