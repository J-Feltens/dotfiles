return {
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
	{
		'nvim-lualine/lualine.nvim',
		dependencies = {
			'nvim-tree/nvim-web-devicons'
		}
	},
}
