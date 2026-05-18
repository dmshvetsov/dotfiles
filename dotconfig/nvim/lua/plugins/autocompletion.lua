return {
  {
    "saghen/blink.cmp",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = 'default',
        -- use similar to Warp terminal autocompletion
        ['<C-f>'] = { 'select_and_accept', 'fallback' },
      },
      sources = {
        -- NOTE: lazyvim uses nvim_lsp in docs for blimk.cmp configuratin but it is not in `providers`
        -- NOTE: function is need to prevent lazyvim to update it https://github.com/LazyVim/LazyVim/discussions/5599
        default = function()
          -- return { "lsp", "path", "buffer" }
          return { 'lsp', 'path', 'snippets', 'buffer' }
        end,
        per_filetype = {
          -- sql = { "dadbod" },
          -- optionally inherit from the `default` sources
          lua = { inherit_defaults = true, "lazydev" },
        },
      },
      completion = {
        -- menu = { auto_show = false },
        -- ghost_text = { enabled = false },
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
