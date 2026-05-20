-- ================================================
--   _   ____  ______  _  _______  _  ___________ 
--  | | / / / / / __ \/ |/ / ___/ / |/ / ___/ __ \
--  | |/ / /_/ / /_/ /    / (_ / /    / (_ / /_/ /
--  |___/\____/\____/_/|_/\___/ /_/|_/\___/\____/ 
-- ================================================

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
	},

	-- 4. Setup ToggleTerm with a floating terminal
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
		require("toggleterm").setup({
			size = 20,
			open_mapping = [[<C-t>]],
			direction = "float",
			float_opts = { border = "curved" }
		})
		end
  	},

	-- 5.Setup Snacks
    {
        "folke/snacks.nvim",
        opts = {
            dashboard = {
                preset = {
                    pick = function(cmd, opts)
                        return LazyVim.pick(cmd, opts)()
                    end,
                    header = [[
                ███████╗ ██╗   ██╗ ███████╗ ████████╗ ███████╗ ███╗   ███╗         Z
                ██╔════╝ ╚██╗ ██╔╝ ██╔════╝ ╚══██╔══╝ ██╔════╝ ████╗ ████║        Z 
                ███████╗  ╚████╔╝  ███████╗    ██║    █████╗   ██╔████╔██║      Z   
                ╚════██║   ╚██╔╝   ╚════██║    ██║    ██╔══╝   ██║╚██╔╝██║    Z     
                ███████║    ██║    ███████║    ██║    ███████╗ ██║ ╚═╝ ██║          
                ╚══════╝    ╚═╝    ╚══════╝    ╚═╝    ╚══════╝ ╚═╝     ╚═╝          
                                                                ---DEVELOPED---          
                    ]],
                    -- stylua: ignore
                    ---@type snacks.dashboard.Item[]
                    keys = {
                        { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                        { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                        { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                        { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                        { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                        { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                    },
                },
            },
            indent = { enabled = true },
            input = { enabled = true },
            notifier = { enabled = true },
            scope = { enabled = true },
            scroll = { enabled = true },
            statuscolumn = { enabled = false },
            words = { enabled = true },
        },
        -- stylua: ignore
        keys = {
            { "<leader>n", function()
                if Snacks.config.picker and Snacks.config.picker.enabled then
                Snacks.picker.notifications()
                else
                Snacks.notifier.show_history()
                end
            end, desc = "Notification History" },
            { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
        },
    },

    -- 6. Setup Plenary
    {
        "nvim-lua/plenary.nvim",
        lazy = true,
    },
}
