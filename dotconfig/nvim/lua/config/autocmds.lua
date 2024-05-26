-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "rust", "move" },
  callback = function()
    require("catppuccin")
    vim.cmd("colorscheme catppuccin-mocha")
  end,
})
