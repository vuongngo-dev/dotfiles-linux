-- ================================================
--   _   ____  ______  _  _______  _  ___________ 
--  | | / / / / / __ \/ |/ / ___/ / |/ / ___/ __ \
--  | |/ / /_/ / /_/ /    / (_ / /    / (_ / /_/ /
--  |___/\____/\____/_/|_/\___/ /_/|_/\___/\____/ 
-- ================================================

return {
	-- 1. Setup Mason
	{
		"mason-org/mason.nvim",
		opts = {
		ensure_installed = {
			"pyright",  -- Python LSP
			"clangd",   -- C/C++ LSP
			"lua-language-server", -- Lua LSP
		},
		},
	},

	-- 2. LSP
	{
		"neovim/nvim-lspconfig",
		opts = {
      	-- Install LSP servers with Mason and configure them with lspconfig
      	servers = {
        pyright = {},
        clangd = {},
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } }, -- Recognize 'vim' as a global variable
            },
          },
        },
      },
      -- This function runs when an LSP server attaches to a buffer, allowing you to set up keymaps and other buffer-local settings
      setup = {
        -- Keep the default LSP keymaps, but you can add your own custom keymaps here
        function()
          vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
              local opts = { buffer = args.buf, silent = true }
              -- Default LSP keymaps
              vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
              vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
              vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
              vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
            end,
          })
        end,
      },
    },
	},
}
