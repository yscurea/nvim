return {
	"smoka7/hop.nvim",
	branch = "v2",
	keys = {
		{ "<Leader>ja", "<cmd>HopAnywhere<CR>", desc = "jump anywhere", mode = { "n", "v" } },
		{ "<Leader>jw", "<cmd>HopWord<CR>", desc = "jump word", mode = { "n", "v" } },
		{ "<Leader>jv", "<cmd>HopVertical<CR>", desc = "jump vertical", mode = { "n", "v" } },
		{ "<Leader>jl", "<cmd>HopLineStart<CR>", desc = "jump line start", mode = { "n", "v" } },
		{ "<Leader>jp", "<cmd>HopPattern<CR>", desc = "jump pattern", mode = { "n", "v" } },
	},
	config = function()
		require("hop").setup({})
	end,
}
