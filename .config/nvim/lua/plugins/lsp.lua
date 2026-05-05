return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Setup Pyright
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
              },
            },
          },
        },
        -- Setup GDScript
        gdscript = {
          cmd = { "ncat", "localhost", "6005" },
          filetypes = { "gd", "gdscript", "gdscript3" },
        },
        -- Setup YAMLLS
        yamlls = {
          settings = {
            yaml = { keyOrdering = false },
          },
        },
      },
    },
  },
}