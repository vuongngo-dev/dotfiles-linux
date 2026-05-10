return {
    -- Setup autocompletion
    {
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
            local cmp = require("cmp")
            opts.mapping = vim.tbl_deep_extend("force", opts.mapping, {
                -- Trigger completion with Tab (only when there are suggestions)
                ["<Tab>"] = cmp.mapping.confirm({ select = true }),
                ["<C-j>"] = cmp.mapping.select_next_item(),
                ["<C-k>"] = cmp.mapping.select_prev_item(),
            })
        end,
    },

    -- Auto-close brackets, quotes, etc. with smart behavior in Insert mode
    {
        "nvim-mini/mini.pairs",
        event = "InsertEnter", -- Just download
        opts = {
            modes = { insert = true, command = false, terminal = false },
        },
    },

    -- Improve file icons with a modern, consistent set of icons that integrate well with the rest of the UI
    {
        "nvim-mini/mini.icons",
        lazy = true,
        opts = {
            preset = "nerd", -- Sử dụng bộ icon Nerd Font để có nhiều biểu tượng hơn
        },
        init = function()
            package.preload["nvim-web-devicons"] = function()
                require("mini.icons").mock_nvim_web_devicons()
                return package.loaded["nvim-web-devicons"]
            end
        end,
    },

    -- Set up nvim-treesitter for enhanced syntax highlighting, indentation, and folding
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		commit = vim.fn.has("nvim-0.12") == 0 and "7caec274fd19c12b55902a5b795100d21531391f" or nil,
		version = false, -- last release is way too old and doesn't work on Windows
		build = function()
			local TS = require("nvim-treesitter")
			if not TS.get_installed then
				LazyVim.error("Please restart Neovim and run `:TSUpdate` to use the `nvim-treesitter` **main** branch.")
				return
			end
			-- make sure we're using the latest treesitter util
			package.loaded["lazyvim.util.treesitter"] = nil
			LazyVim.treesitter.build(function()
				TS.update(nil, { summary = true })
			end)
		end,
		event = { "LazyFile", "VeryLazy" },
		cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
		opts_extend = { "ensure_installed" },
		---@alias lazyvim.TSFeat { enable?: boolean, disable?: string[] }
		---@class lazyvim.TSConfig: TSConfig
		opts = {
			-- LazyVim config for treesitter
			indent = { enable = true }, ---@type lazyvim.TSFeat
			highlight = { enable = true }, ---@type lazyvim.TSFeat
			folds = { enable = true }, ---@type lazyvim.TSFeat
			ensure_installed = {
				"bash",
				"c",
				"diff",
				"html",
				"javascript",
				"jsdoc",
				"json",
				"lua",
				"luadoc",
				"luap",
				"markdown",
				"markdown_inline",
				"printf",
				"python",
				"query",
				"regex",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"xml",
			},
		},
		---@param opts lazyvim.TSConfig
		config = function(_, opts)
			local TS = require("nvim-treesitter")

			setmetatable(require("nvim-treesitter.install"), {
				__newindex = function(_, k)
					if k == "compilers" then
						vim.schedule(function()
							LazyVim.error({
								"Setting custom compilers for `nvim-treesitter` is no longer supported.",
								"",
								"For more info, see:",
								"- [compilers](https://docs.rs/cc/latest/cc/#compile-time-requirements)",
							})
						end)
					end
				end,
			})

			-- some quick sanity checks
			if not TS.get_installed then
				return LazyVim.error("Please use `:Lazy` and update `nvim-treesitter`")
			elseif type(opts.ensure_installed) ~= "table" then
				return LazyVim.error("`nvim-treesitter` opts.ensure_installed must be a table")
			end

			-- setup treesitter
			TS.setup(opts)
			LazyVim.treesitter.get_installed(true) -- initialize the installed langs

			-- install missing parsers
			local install = vim.tbl_filter(function(lang)
				return not LazyVim.treesitter.have(lang)
			end, opts.ensure_installed or {})
			if #install > 0 then
				LazyVim.treesitter.build(function()
					TS.install(install, { summary = true }):await(function()
						LazyVim.treesitter.get_installed(true) -- refresh the installed langs
					end)
				end)
			end

			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("lazyvim_treesitter", { clear = true }),
				callback = function(ev)
					local ft, lang = ev.match, vim.treesitter.language.get_lang(ev.match)
					if not LazyVim.treesitter.have(ft) then
						return
					end

					---@param feat string
					---@param query string
					local function enabled(feat, query)
						local f = opts[feat] or {} ---@type lazyvim.TSFeat
						return f.enable ~= false
							and not (type(f.disable) == "table" and vim.tbl_contains(f.disable, lang))
							and LazyVim.treesitter.have(ft, query)
					end

					-- highlighting
					if enabled("highlight", "highlights") then
						pcall(vim.treesitter.start, ev.buf)
					end

					-- indents
					if enabled("indent", "indents") then
						LazyVim.set_default("indentexpr", "v:lua.LazyVim.treesitter.indentexpr()")
					end

					-- folds
					if enabled("folds", "folds") then
						if LazyVim.set_default("foldmethod", "expr") then
							LazyVim.set_default("foldexpr", "v:lua.LazyVim.treesitter.foldexpr()")
						end
					end
				end,
			})
		end,
	},

	-- 2. Install Mason LSP servers và formatters cho Python và Bash
	{
		"mason-org/mason.nvim",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
				"pyright", -- LSP for Python
				"gdscript", -- LSP for GDScript
				"bash-language-server", -- LSP for Bash
				"black", -- Formatter for Python
				"isort", -- Import sorter for Python
				"shfmt", -- Formatter for Bash
			})
		end,
	},
}