return {
	"kylechui/nvim-surround",
	lazy = true,
	version = "*",
	keys = {
		{ "ds", mode = { "n" }, desc = "delete surround" },
		{ "cs", mode = { "n" }, desc = "change surround" },
		{ "ys", mode = { "n" }, desc = "attach surround" },
	},
	config = function()
		require("nvim-surround").setup()
	end,
}
