return {
  -- Setup Mason
  { "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "pyright", "yamlls", "solargraph", "clangd", "texlab" }
    }
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "mason-org/mason-lspconfig.nvim" },
    },
    opts = {
      -- Show inlay hints
      inlay_hints = { enabled = true },
      -- Configuration for servers with automatic setup via mason-lspconfig
      servers = {
        pyright = {}, -- Setup Pyright
        yamlls = {}, -- Setup YAMLLS
        lua_ls = {}, -- Setup Lua
        solargraph = {}, -- Setup Ruby
        clangd = {}, -- Setup C/C++
        texlab = {}, -- Setup LaTeX
      },
    },
  },
}