return {
	"monkoose/matchparen.nvim",
	init = function()
		vim.g.loaded_matchparen = 1
	end,
	config = function()
		require("matchparen").setup({
			on_startup = true,
			hl_group = "MatchParen",
			augroup_name = "matchparen",
			debounce_time = 100,
		})
	end,
}
