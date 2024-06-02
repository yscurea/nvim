---@type LazySpec[]
return {
	{
		"nvim-treesitter/nvim-treesitter",
		cmd = {
			"TSInstall",
			"TSBufEnable",
			"TSBufDisable",
			"TSModuleInfo",
		},
		build = ":TSUpdate",
		event = "BufReadPost",
		config = function()
			require("nvim-treesitter.configs").setup({
				yati = {
					enable = true,
					default_lazy = true,
					default_fallback = "auto",
				},
				ensure_installed = {},
				highlight = {
					enable = true,
					use_languagetree = true,
				},
				indent = {
					enable = false,
				},
			})
		end,
	},
	{
		"andymass/vim-matchup",
		init = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
			vim.g.loaded_matchparen = 1
			vim.g.loaded_matchit = 1
			require("match-up").setup({
				treesitter = {
					stopline = 500,
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		lazy = true,
	},
	{
		"numToStr/Comment.nvim",
		keys = {
			{ "gc", mode = { "n", "x" } },
			{ "gb", mode = { "n", "x" } },
			{ "gcc", mode = "n" },
		},
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		keys = {
			{ "gc", mode = { "n", "x" } },
			{ "gb", mode = { "n", "x" } },
			{ "gcc", mode = "n" },
		},
		config = function()
			require("ts_context_commentstring").setup({
				enable_autocmd = false,
			})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	{
		"andersevenrud/nvim_context_vt",
		cmd = "NvimContextVtToggle",
		config = function()
			require("nvim_context_vt").setup({
				enabled = false,
			})
		end,
	},
}
