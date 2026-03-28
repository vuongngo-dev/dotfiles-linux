-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Tự động sync clipboard của Neovim với hệ thống Wayland/Hyprland
vim.opt.clipboard = "unnamedplus"

-- Bật số dòng tương đối (Relative number) - Cực kỳ cần thiết để nhảy dòng nhanh (vd: 5j, 10k)
vim.opt.relativenumber = true

-- Cấu hình Tab chuẩn (4 spaces cho C/C++, 2 cho Web/HTML)
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

-- Tắt wrap code (không tự xuống dòng nếu code quá dài)
vim.opt.wrap = false
