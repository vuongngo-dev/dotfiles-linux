return {
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },
  {
    "AstroNvim/astrocore",
    optional = true,
    opts = function()
      -- Sync clipboard between OS and Neovim.
      vim.opt.clipboard = "unnamedplus"
      if vim.fn.executable("wl-copy") == 1 then
        vim.g.clipboard = {
          name = "wl-clipboard",
          copy = {
            ["+"] = "wl-copy",
            ["*"] = "wl-copy",
          },
          paste = {
            ["+"] = "wl-paste",
            ["*"] = "wl-paste",
          },
          cache_enabled = 1,
        }
      end
    end,
  },
}