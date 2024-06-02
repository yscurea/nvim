return {
	"haya14busa/vim-edgemotion",
	lazy = true,
	keys = {
		{ "<Leader>jj", "<Plug>(edgemotion-j)", desc = "jump edge down", mode = { "n", "v" } },
		{ "<Leader>kk", "<Plug>(edgemotion-k)", desc = "jump edge up", mode = { "n", "v" } },
	},
}
