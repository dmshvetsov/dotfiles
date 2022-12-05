-- # nvim-lspconfig 
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {"sumneko_lua", "tsserver", "rust_analyzer"},
    automatic_installation = true
})

-- After setting up mason-lspconfig you may set up servers via lspconfig
-- require("lspconfig").sumneko_lua.setup {}
-- require("lspconfig").rust_analyzer.setup {}
-- ...
require('lspconfig').tsserver.setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig').rust_analyzer.setup{
    on_attach = on_attach,
    flags = lsp_flags,
    settings = {
      ["rust-analyzer"] = {}
    }
}
require('lspconfig').eslint.setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

-- # null-ls LSP diagnostics, code actions, completion, linters, formatters.
--
-- Unlike the VS Code and coc.nvim ecosystems, Neovim doesn't provide a way for non-LSP sources to hook into its LSP client. null-ls is an attempt to bridge that gap and simplify the process of creating, sharing, and setting up LSP sources using pure Lua.
-- null-ls is also an attempt to reduce the boilerplate required to set up general-purpose language servers and improve performance by removing the need for external processes.

local null_ls = require("null-ls")

null_ls.setup({
    -- available built in configs https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
    sources = {
        -- also prettierd and prettier_d_slim and prettier_standard available
        null_ls.builtins.formatting.prettier,
        -- code actions for eslint
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.completion.spell,
        -- code actions for gitsigns plugin
        null_ls.builtins.code_actions.gitsigns,
        -- code actions for english prose linter
        -- null_ls.builtins.code_actions.proselint,
        -- code actions for refactoring plugin
        -- null_ls.builtins.code_actions.refactoring
        -- ... more built ins available, check the link above
    }
})

-- # cmp language autocompletion
local ls = require("luasnip")
local cmp = require("cmp")

cmp.setup({
    view = {
        entries = "custom",
    },
    snippet = {
        expand = function(args) ls.lsp_expand(args.body) end
    },
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    -- mapping = {
    --     ['<C-Space>'] = cmp.mapping.complete(),
    --     ['<CR>'] = cmp.mapping.confirm({select = false}),
    --     ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    --     ['<C-f>'] = cmp.mapping.scroll_docs(4),
    --     ['<C-n>'] = cmp.mapping.select_next_item({
    --         behavior = cmp.SelectBehavior.Insert
    --     }),
    --     ['<C-p>'] = cmp.mapping.select_prev_item({
    --         behavior = cmp.SelectBehavior.Insert
    --     }),
    --     ["<Tab>"] = cmp.mapping(function(fallback)
    --         if ls.expand_or_jumpable() then
    --             ls.expand_or_jump()
    --         else
    --             fallback()
    --         end
    --     end, {"i", "s"}),

    --     ["<S-Tab>"] = cmp.mapping(function(fallback)
    --         if ls.jumpable(-1) then
    --             ls.jump(-1)
    --         else
    --             fallback()
    --         end
    --     end, {"i", "s"})
    -- },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'luasnip' },
    }
    -- formatting = {
    --   format = lspkind.cmp_format({with_text = false, maxwidth = 50})
    -- }
})

