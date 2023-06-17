return {
	"simrat39/rust-tools.nvim",
	requires = { "nvim-lua/plenary.nvim", "rust-lang/rust.vim" },
	module = "rust-tools",
	ft = { "rust" },
	config = function()
		require("rust-tools").setup({})
	end,
}
