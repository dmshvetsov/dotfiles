-- https://github.com/VonHeikemen/lsp-zero.nvim
--
-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase

local lsp = require('lsp-zero').preset({
  name = 'recommended',
  suggest_lsp_servers = false,
  sign_icons = {
    error = 'e',
    warn = 'w',
    hint = 'h',
    info = 'i',
  }
})

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'lua_ls',
  'rust_analyzer',
  'move_analyzer',
  'tailwindcss',
})

-- Autocompletion mappings
local cmp_mappings = lsp.defaults.cmp_mappings({
  -- ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  -- ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  -- ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  -- ["<C-Space>"] = cmp.mapping.complete(),
})
-- disable completion with tab
-- this helps with copilot setup
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

-- Configure lua language server for neovim
-- lsp.nvim_workspace()

-- Key mappongs for vim.diagnostic
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<C-p>', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<C-n>', vim.diagnostic.goto_next, opts)

-- language servers mappings.
-- See `:help vim.lsp.*` for documentation on any of the below functions
local on_attach = function(client, bufnr)
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<leader>p', function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
lsp.on_attach(on_attach)

local lsp_config = require('lspconfig')
lsp_config.move_analyzer.setup({
  server = {
    -- move and move-analyzer support different account address lengths,
    -- make sure to use binary that compiled for specific length
    -- e.g. Sui and Aptos uses different lengths for accounts and the same move-analyzer binary cannot be used to
    -- as a lsp server
    --
    -- aptos move analyzer path:
    path = '/Users/dima/.asdf/shims/move-analyzer'
  }
})

lsp.setup()

-- Formatters configuration

local null_ls = require('null-ls')

null_ls.setup({
  sources = {
    -- general
    -- ensure dependencies installed:
    -- brew install typos-cli
    null_ls.builtins.diagnostics.typos,
    -- js, ts, vue
    -- ensure dependencies installed:
    -- projects have esling and prettier installed
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.diagnostics.eslint,
    -- lua
    null_ls.builtins.formatting.stylua,
  }
})
