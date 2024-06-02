return {
	"folke/which-key.nvim",
	lazy = true,
	keys = {
		"<Leader>",
		'"',
		"'",
		"`",
		"c",
		"d",
		"y",
		"g",
		"z",
		{ "<Leader>wK", "<cmd>WhichKey<CR>", desc = "Which-key all keymaps", mode = "n" },
		{
			"<Leader>wk",
			function()
				local input = vim.fn.input("WhichKey: ")
				vim.cmd("WhichKey " .. input)
			end,
			desc = "Which-key all keymaps",
			mode = "n",
		},
	},
	config = function()
		require("which-key").setup({})
	end,
}
