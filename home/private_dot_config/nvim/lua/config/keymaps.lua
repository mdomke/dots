-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")

vim.g.mapleader = ","
vim.g.maplocalleader = ","

vim.keymap.set("n", ";;", "<cmd>w<cr><esc>", { desc = "Save file" })

vim.keymap.set("n", "qq", "<cmd>q<cr><esc>", { desc = "Save file" })
-- vim.keymap.set("n", "<leader>gg", "<cmd>Neogit kind=vsplit<cr>", { desc = "Neogit" })
vim.keymap.set("n", "<leader>gg", function()
  Util.float_term({ "gitui" }, { cwd = Util.get_root() })
end, { desc = "GitUI (root dir)" })
vim.keymap.set("n", "<leader>gG", function()
  Util.float_term({ "gitui" })
end, { desc = "GitUI (cwd)" })

vim.keymap.set("n", "<leader>gdh", "<cmd>DiffviewFileHistory<cr>", { desc = "Git file history" })
vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>", { desc = "Git diff" })

vim.keymap.del({ "n", "i", "v" }, "<A-k>")
vim.keymap.del({ "n", "i", "v" }, "<A-j>")
