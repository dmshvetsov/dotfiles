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
