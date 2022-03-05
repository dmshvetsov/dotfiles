-- solargraph, a language server for Ruby
--
--   Commands:
--
-- Default Values:
--   cmd = { "solargraph", "stdio" }
--   filetypes = { "ruby" }
--   root_dir = root_pattern("Gemfile", ".git")
--   settings = {
--     solargraph = {
--       diagnostics = true
--     }
--   }
require'lspconfig'.solargraph.setup{
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}
