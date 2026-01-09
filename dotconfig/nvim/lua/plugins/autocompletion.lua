return {
  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        -- NOTE: lazyvim uses nvim_lsp in docs for blimk.cmp configuratin but it is not in `providers`
        -- NOTE: function is need to prevent layvim to update it https://github.com/LazyVim/LazyVim/discussions/5599
        default = function()
          return { "lsp", "path", "buffer" }
        end,
        per_filetype = {
          sql = { "dadbod" },
          -- optionally inherit from the `default` sources
          lua = { inherit_defaults = true, "lazydev" },
        },
      },
      completion = {
        menu = { auto_show = false },
        ghost_text = { enabled = false },
        accept = {
          auto_brackets = {
            -- disable adding brackets for funcitons
            kind_resolution = {
              enabled = false,
            },
            -- disable adding brackets for funcitons
            semantic_token_resolution = {
              enabled = false,
            },
          },
        },
      },
    },
  },
}
