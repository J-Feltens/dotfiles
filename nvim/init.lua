-- nvim tree
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

vim.g.mapleader = " "

vim.o.clipboard = "unnamedplus"
vim.o.background = "dark"
vim.wo.number = true
vim.o.ttyfast = true

require("config.lazy")

-- highlight text when copying ('y' or 'yy')
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight text when yanking",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- color theme
-- vim.cmd[colorscheme tokyonight-moon]]
-- vim.cmd [[colorscheme kanagawa]]
-- vim.cmd [[colorscheme gruvbox]]
vim.cmd([[colorscheme catppuccin-macchiato]])

vim.cmd([[NvimTreeOpen]])

-- lua line
require("lualine").setup({
	options = {
		globalstatus = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { { "tabs", mode = 3 } },
		lualine_c = { "filename", "filetype" },
		lualine_x = { "tabs" },
		lualine_y = { "encoding" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})

-- custom keybinds
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })

local opts = { noremap = true, silent = true }

-- Window navigation
vim.api.nvim_set_keymap("n", "<Leader><Up>", "<C-w>k", opts)    -- Navigate up
vim.api.nvim_set_keymap("n", "<Leader><Down>", "<C-w>j", opts)  -- Navigate down
vim.api.nvim_set_keymap("n", "<Leader><Left>", "<C-w>h", opts)  -- Navigate left
vim.api.nvim_set_keymap("n", "<Leader><Right>", "<C-w>l", opts) -- Navigate right

-- space-f-c: open nvim configs
vim.keymap.set("n", "<leader>fc", function()
	builtin.find_files({
		cwd = vim.fn.stdpath("config"),
	})
end, {
	desc = "Search in nvim config files",
})

-- space-f-d: open dotfiles
vim.keymap.set("n", "<leader>fd", function()
	builtin.find_files({
		cwd = "~/dotfiles",
	})
end, {
	desc = "Search in nvim config files",
})

local dap = require("dap")
local dap_python = require("dap-python")

-- Set keybindings for debugging
vim.api.nvim_set_keymap(
	"n",
	"<leader>db",
	":lua require'dap'.toggle_breakpoint()<CR>",
	{ noremap = true, silent = true }
)

vim.api.nvim_set_keymap("n", "<leader>dd", ":lua require'dapui'.open()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
