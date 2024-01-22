-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- assign vim leader key
vim.g.mapleader = "\\"
vim.g.maplocalleader = " "
-- disable default vim file tree navigator
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
-- show column for git, eslint and other signs
-- this removes columns shift between no sign or first signs added
vim.g.signbooleancolumn = "yes:1"
