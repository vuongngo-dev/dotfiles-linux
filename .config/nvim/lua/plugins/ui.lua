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

	-- 3. Setup Noice
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			-- Noice relies on nui.nvim for rendering its UI components
			"MunifTanjim/nui.nvim",
		},
		opts = {
			lsp = {
				-- Override markdown rendering so that **cmp** and other plugins use **Treesitter** for rendering markdown
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			-- Set up presets for a more polished UI experience with Noice
			presets = {
				bottom_search = false, -- Không hiện tìm kiếm ở dưới cùng
				command_palette = true, -- Biến thanh gõ lệnh ':' thành dạng command palette (như VSCode)
				long_message_to_split = true, -- Nếu log/thông báo quá dài, tự mở sang một cửa sổ split
				inc_rename = false,
				lsp_doc_border = true, -- Thêm viền cho hộp thoại tài liệu code
			},
		},
	}
}
