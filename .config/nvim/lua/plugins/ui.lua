return {
	-- 1. Install Catppuccin theme with transparent background and LSP integration
	{
		"catppuccin/nvim",
		name = "catppuccin",
		opts = {
			transparent_background = true,
			integrations = {
				neotree = true,
				mason = true,
				cmp = true,
				gitsigns = true,
				treesitter = true,
				telescope = {
					enabled = true,
					style = "nvchad",
				},
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
					},
					inlay_hints = {
						background = true,
					},
				},
			},
		},
	},

	-- 2. Set Catppuccin as the default colorscheme for LazyVim
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "catppuccin-mocha",
		},
	},
}
