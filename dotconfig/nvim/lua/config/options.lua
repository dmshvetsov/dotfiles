-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- assign vim leader key
vim.g.mapleader = "\\"
vim.g.maplocalleader = " "
-- disable default vim file tree navigator
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1
-- show column for git, eslint and other signs
-- this removes columns shift between no sign or first signs added
vim.g.signbooleancolumn = "yes:1"
-- disabable conceal syntax vim feature
vim.opt.conceallevel = 0
-- disable layzvim auto formating of buffers on write (save)
vim.g.autoformat = false

-- this option is on tryout
-- added to fix lsp-servers switch root directory to a current package in monorepo projects
-- an alternative is to use <leader>fF to explicitly open find_files in neovim cwd (where nvim was run, by default)
--
-- why it is happening and explanation of the solution below https://github.com/LazyVim/LazyVim/discussions/2150#discussioncomment-7787591
vim.g.root_spec = {"cwd"}
