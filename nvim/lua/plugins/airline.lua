return {
	{
		"w0ng/vim-hybrid",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme hybrid]])
		end,
	},
	{
		"vim-airline/vim-airline",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.airline_powerline_fonts = 1
		end,
	},
	{
		"vim-airline/vim-airline-themes",
		lazy = false,
		priority = 1000,
		dependencies = {
			"w0ng/vim-hybrid",
			"vim-airline/vim-airline",
		},
	},
}
