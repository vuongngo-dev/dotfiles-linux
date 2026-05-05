-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Sync clipboard between OS and Neovim.
vim.opt.clipboard = "unnamedplus"

vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent
vim.opt.tabstop = 4 -- Use spaces instead of tabs
vim.opt.expandtab = true -- Convert tabs to spaces

vim.opt.ignorecase = true -- Ignore case in search patterns
vim.opt.smartcase = true -- Enable smart case search
vim.opt.wrap = true -- Enable line wrapping
vim.opt.cursorline = true -- Highlight the current line
vim.opt.termguicolors = true -- Enable true color support
vim.opt.signcolumn = "yes" -- Always show the sign column
