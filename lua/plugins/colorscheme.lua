---@type LazySpec[]
return {
	{
		"olimorris/onedarkpro.nvim",
		lazy = false,
		priority = 10000,
		config = function()
			vim.cmd([[colorscheme onedark_dark]])
		end,
	},
	{ "tomasr/molokai", lazy = true },
	{ "catppuccin/nvim", lazy = true, name = "catppuccin" },
	{ "dracula/vim", lazy = true, name = "dracula" },
	{ "miikanissi/modus-themes.nvim", lazy = true },
	{ "daschw/leaf.nvim", lazy = true },
	{ "Mofiqul/vscode.nvim", lazy = true },
	{ "luisiacc/gruvbox-baby", lazy = true },
	{ "rebelot/kanagawa.nvim", lazy = true },
	{ "marko-cerovac/material.nvim", lazy = true },
	{ "EdenEast/nightfox.nvim", lazy = true },
	{ "rose-pine/neovim", lazy = true },
	{ "folke/tokyonight.nvim", lazy = true },
	{ "yuys13/hackshark.nvim", lazy = true },
	{ "cocopon/iceberg.vim", lazy = true },
	{ "romainl/vim-dichromatic", lazy = true },
	{ "PierreCapo/voir.vim", lazy = true },
	{ "machakann/vim-colorscheme-tatami", lazy = true },
	{ "jonathanfilip/vim-lucius", lazy = true },
	{ "junegunn/seoul256.vim", lazy = true },
	{ "joshdick/onedark.vim", lazy = true },
	{ "sainnhe/edge", lazy = true },
}
