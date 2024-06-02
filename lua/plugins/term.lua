function GitUIToggle()
	local Terminal = require("toggleterm.terminal").Terminal
	local gitui = Terminal:new({
		cmd = "gitui",
		direction = "float",
		hidden = true,
		count = 10,
		float_opts = {
			width = function()
				return math.floor(vim.o.columns * 0.9)
			end,
		},
	})
	gitui:toggle()
end

return {
	"akinsho/toggleterm.nvim",
	lazy = true,
	version = "*",
	keys = {
		{
			"<A-l>",
			"<cmd>ToggleTerm direction=vertical size=90<CR>",
			desc = "Open right terminal",
			mode = { "n", "i", "t" },
		},
		{
			"<A-f>",
			"<cmd>ToggleTerm direction=float size=80<CR>",
			desc = "Open center terminal",
			mode = { "n", "i", "t" },
		},
		{
			"<A-j>",
			"<Esc><cmd>ToggleTerm direction=horizontal size=20<CR>",
			desc = "Open bottom terminal",
			mode = { "n", "i" },
		},
		{
			"<A-g>",
			"<cmd>lua GitUIToggle()<CR>",
			desc = "Open gitui terminal",
			mode = { "n", "i", "t" },
		},
	},
	cmd = { "ToggleTerm" },
	config = function()
		require("toggleterm").setup({
			float_opts = {
				border = "double",
				width = 100,
			},
		})
	end,
}
