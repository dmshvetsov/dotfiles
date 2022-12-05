-- NOTE: this file no longer used
-- config moved to main lsp.config file
--
-- nvim-cmp setup
-- a completion plugin for neovim
local cmp = require'cmp'

cmp.setup({
  -- snippet engine is required
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },

  mapping = {
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },

  sources = {
    -- { name = 'nvim_lsp' },
    -- nvim-cmp source for neovim builtin LSP client
    -- https://github.com/hrsh7th/cmp-nvim-lsp
    -- { name = 'nvim_lua' },

    -- For vsnip user.
    -- { name = 'vsnip' },

    -- For luasnip user.
    -- { name = 'luasnip' },

    -- For ultisnips user.
    -- { name = 'ultisnips' },
  }
})
