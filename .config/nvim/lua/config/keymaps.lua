-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Leader key
vim.g.mapleader = " "

-- For example, to disable the default keymap for saving a file, you can add:
vim.keymap.set("i", "jk", "<ESC>", { desc = "Disable Insert mode" })
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)