return {
	"ray-x/navigator.lua",
	requires = {
		{ "ray-x/guihua.lua" },
		{ "neovim/nvim-lspconfig" },
	},
	config = function()
		require("navigator").setup()
	end,
}
