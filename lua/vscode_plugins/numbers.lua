return {
	"myusuf3/numbers.vim",
	event = "VimEnter",
	init = function()
		vim.g.numbers_exclude = {
			"tagbar",
			"NvimTree",
			"nerdtree",
			"gundo",
			"minibufexpl",
			"toggleterm",
			"dashboard",
			"packer",
		}
	end,
}
