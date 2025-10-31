return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        ---   default
        ---   ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ---   disable C-space `show`
        ["<C-space>"] = { "fallback_to_mappings" },
        ---   `show` on C-p or C-n
        ["<C-p>"] = { "show", "select_prev", "fallback_to_mappings" },
        ["<C-n>"] = { "show", "select_next", "fallback_to_mappings" },
      },
      sources = {
        -- NOTE: lazyvim uses nvim_lsp in docs for blimk.cmp configuratin but it is not in `providers`
        default = { "lsp", "path", "snippets", "buffer", "codeium" },
        per_filetype = {
          sql = { "dadbod" },
          -- optionally inherit from the `default` sources
          lua = { inherit_defaults = true, "lazydev" },
        },
        providers = {
          codeium = { name = "Codeium", module = "codeium.blink", async = true },
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
