" Collection of common configurations for Neovim's built-in language server client.
" using [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)

lua << EOF
-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
local lsp_installer = require("nvim-lsp-installer")

--
-- utility
--

vim.opt.updatetime = 300

local function lsp_highlight_symbol(client)
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
      ]],
      false
    )
  end
end

local function ts_organize_imports()
  vim.lsp.buf.execute_command(
    {
      command = "_typescript.organizeImports",
      arguments = {vim.api.nvim_buf_get_name(0)},
      title = ""
    }
  )
end


--
-- ???
--

vim.diagnostic.config(
  {
    -- disable virtual text
    -- TODO: replace with float window
    virtual_text = true,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      source = "always",
      -- border = "rounded",
      -- header = "",
      -- prefix = "",
    },
  }
)

--
-- servers setup
--

lsp_installer.on_server_ready(function(server)
  --
  -- shared language servers setup
  --

  local shared_on_attach = function(_, bufnr)
    -- TODO: move either to vim mapping below or vim mappings here
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>r', "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
  end

  local sharedCapabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()) 
  local opts = {}

  --
  -- specific language servers setup
  --

  if server.name == 'eslint' then
    -- opts.filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'css', 'scss' }
    -- opts.init_options = {
    --   linters = {
    --     eslint = {
    --       command = 'eslint',
    --       rootPatterns = { '.git' },
    --       debounce = 100,
    --       args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
    --       sourceName = 'eslint',
    --       securities = {
    --         [2] = 'error',
    --         [1] = 'warning'
    --       }
    --     },
    --     filetypes = {
    --       javascript = 'eslint',
    --       javascriptreact = 'eslint',
    --       typescript = 'eslint',
    --       typescriptreact = 'eslint',
    --     },
    --   }
    -- }
  end

  if server.name == 'tsserver' then
    -- TypeScript
    --
    -- Commands:
    --
    -- Default Values:
    --   cmd = { "typescript-language-server", "--stdio" }
    --   filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
    --   root_dir = root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")
    opts.on_attach = function(client, bufnc)
      shared_on_attach(client, bufnc)
      lsp_highlight_symbol(client)
    end
    opts.commands = {
      OrganizeImports = {
        ts_organize_imports,
        description = "Organize Imports"
      }
    }
  end

  --
  -- server default setup
  --

  if opts.on_attach == nil then
    -- if server does not define on_attach function then use the shared one
    opts.on_attach = shared_on_attach
  end
  if opts.capabilities == nil then
    -- if server does not define capabilities function then use the shared one
    opts.capabilities = sharedCapabilities
  end

  -- This setup() function is exactly the same as lspconfig's setup function.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)
end)
EOF

" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.diagnostic.goto_next()<CR>

" auto-format
" autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
" autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 100)

" language servers
luafile $HOME/dotfiles/dotconfig/nvim/autocompletion.config.lua
" luafile $HOME/dotfiles/dotconfig/nvim/lsp.tsserver.lua
" luafile $HOME/dotfiles/dotconfig/nvim/lsp.diagnostic.lua
" luafile $HOME/dotfiles/dotconfig/nvim/lsp.lua.lua
" luafile $HOME/dotfiles/dotconfig/nvim/lsp.ruby.lua

"
" styling
"

" errors in Red
hi LspDiagnosticsVirtualTextError guifg=Red ctermfg=Red
" Warnings in Yellow
hi LspDiagnosticsVirtualTextWarning guifg=Yellow ctermfg=Yellow
" Info and Hints in White
hi LspDiagnosticsVirtualTextInformation guifg=White ctermfg=White
hi LspDiagnosticsVirtualTextHint guifg=White ctermfg=White

" Underline the offending code
hi LspDiagnosticsUnderlineError guifg=NONE ctermfg=NONE cterm=underline gui=underline
hi LspDiagnosticsUnderlineWarning guifg=NONE ctermfg=NONE cterm=underline gui=underline
hi LspDiagnosticsUnderlineInformation guifg=NONE ctermfg=NONE cterm=underline gui=underline
hi LspDiagnosticsUnderlineHint guifg=NONE ctermfg=NONE cterm=underline gui=underline
