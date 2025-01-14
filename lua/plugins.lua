return {
	{ 'tpope/vim-commentary' },
	{ 'jiangmiao/auto-pairs' },
	{ 'mong8se/actually.nvim', enabled = false },
	{ 'tpope/vim-sleuth' },
	{
		'folke/tokyonight.nvim',
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		dependencies = {
			'nvim-lua/plenary.nvim',
		}
	},
	{
		'rebelot/kanagawa.nvim',
		lazy = false,
		priority = 1000,
	},
	{
		'neovim/nvim-lspconfig',
		config = function()
			require('lsp.lsp-config')
		end,

		dependencies = {
			{ 'williamboman/mason.nvim', config = true },
			'williamboman/mason-lspconfig.nvim',
		},
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup {
				sort = {
					sorter = "case_sensitive",
				},
				view = {
					width = 40,
				},
				renderer = {
					group_empty = true,
				},
				filters = {
					dotfiles = true,
				},
			}
		end,
	},
	{
		"Dan7h3x/neaterm.nvim",
		branch = "stable",
		event = "VeryLazy",
		opts = {
			-- Default keymaps
			use_default_keymaps = true,
			keymaps = {
				toggle = '<A-t>',
				new_vertical = '<C-\\>',
				new_horizontal = '<C-.>',
				new_float = '<C-A-t>',
				close = '<A-d>',
				next = '<C-PageDown>',
				prev = '<C-PageUp>',
				move_up = '<C-S-Up>',
				move_down = '<C-S-Down>',
				move_left = '<C-S-Left>',
				move_right = '<C-S-Right>',
				resize_up = '<C-A-Up>',
				resize_down = '<C-A-Down>',
				resize_left = '<C-A-Left>',
				resize_right = '<C-A-Right>',
				focus_bar = '<C-A-b>',
				repl_toggle = '<leader>rt',
				repl_send_line = '<leader>rl',
				repl_send_selection = '<leader>rs',
				repl_send_buffer = '<leader>rb',
				repl_clear = '<leader>rc',
				repl_history = '<leader>rh',
				repl_variables = '<leader>rv',
				repl_restart = '<leader>rR',
			},
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"ibhagwan/fzf-lua",
		},
	},
	{
		'saghen/blink.cmp',
		-- optional: provides snippets for the snippet source
		dependencies = 'rafamadriz/friendly-snippets',

		-- use a release tag to download pre-built binaries
		version = '*',
		-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		-- If you use nix, you can build from source using latest nightly rust with:
		-- build = 'nix run .#build-plugin',

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- 'default' for mappings similar to built-in completion
			-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
			-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
			-- See the full "keymap" documentation for information on defining your own keymap.
			keymap = { preset = 'super-tab' },

			appearance = {
				-- Sets the fallback highlight groups to nvim-cmp's highlight groups
				-- Useful for when your theme doesn't support blink.cmp
				-- Will be removed in a future release
				use_nvim_cmp_as_default = true,
				-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = 'mono'
			},

			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = { 'lsp', 'path', 'snippets', 'buffer' },
			},
		},
		opts_extend = { "sources.default" }
	},
	{
		{
			"folke/which-key.nvim",
			event = "VeryLazy",
			opts = {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			},
			keys = {
				{
					"<leader>?",
					function()
						require("which-key").show({ global = false })
					end,
					desc = "Buffer Local Keymaps (which-key)",
				},
			},
		}
	},
	{
		'stevearc/conform.nvim',
		opts = {},
		config = function()
			require("conform").setup({
				format_on_save = {
					-- These options will be passed to conform.format()
					timeout_ms = 500,
					lsp_format = "fallback",
				},
				formatters_by_ft = {
					lua = { "stylua" },
					-- Conform will run multiple formatters sequentially
					python = { "black" },
					-- Conform will run the first available formatter
					javascript = { "prettierd", "prettier", stop_after_first = true },
				},
			})
		end,
	},
	{
		"ya2s/nvim-cursorline",
		config = function()
			require("nvim-cursorline").setup({
				cursorline = {
					enable = true,
					timeout = 0,
					number = true, -- Set to true if you want the line number to highlight with the cursor line
				},
				cursorword = {
					enable = true,
					min_length = 2, -- Minimum word length to highlight
					hl = { underline = true },
				},
			})
		end,
	},
	--{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = ... }
}
