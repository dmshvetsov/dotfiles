-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")
local map = Util.safe_keymap_set

-- lazygit
map("n", "<leader>gg", ":Neogit<cr>", { desc = "Neogit (root dir)" })
map("n", "<leader>gG", ":Neogit cwd=%:p:h<cr>", { desc = "Neogit (cwd)" })
