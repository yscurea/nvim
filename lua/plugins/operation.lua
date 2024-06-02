return {
	{
		"phaazon/hop.nvim",
		branch = "v2",
		keys = {
			{ "<Leader>ja", "<cmd>HopAnywhere<CR>", desc = "jump anywhere", mode = { "n", "v" } },
			{ "<Leader>jw", "<cmd>HopWord<CR>", desc = "jump word", mode = { "n", "v" } },
			{ "<Leader>jv", "<cmd>HopVertical<CR>", desc = "jump vertical", mode = { "n", "v" } },
			{ "<Leader>jl", "<cmd>HopLineStart<CR>", desc = "jump line start", mode = { "n", "v" } },
			{ "<Leader>jp", "<cmd>HopPattern<CR>", desc = "jump pattern", mode = { "n", "v" } },
		},
		config = true,
	},
	{
		"haya14busa/vim-edgemotion",
		keys = {
			{ "<Leader>jj", "<Plug>(edgemotion-j)", desc = "jump edge down", mode = { "n", "v" } },
			{ "<Leader>kk", "<Plug>(edgemotion-k)", desc = "jump edge up", mode = { "n", "v" } },
		},
	},
	{
		"mg979/vim-visual-multi",
		keys = { "<C-Down>", "<C-Up>", "<C-n>", "n", "N", "[", "]", "q", "Q" },
	},
	{
		"kylechui/nvim-surround",
		lazy = true,
		version = "*",
		keys = {
			{ "ds", mode = { "n" }, desc = "delete surround" },
			{ "cs", mode = { "n" }, desc = "change surround" },
			{ "ys", mode = { "n" }, desc = "attach surround" },
		},
		config = true,
	},
	{
		"arthurxavierx/vim-caser",
		lazy = true,
		keys = {
			{ "gsm", mode = { "n" }, desc = "to UpperCamelCase" },
			{ "gsc", mode = { "n" }, desc = "to camelCase" },
			{ "gs_", mode = { "n" }, desc = "to snake_case" },
			{ "gsu", mode = { "n" }, desc = "to UPPER_CASE" },
			{ "gst", mode = { "n" }, desc = "to Title Case" },
			{ "gss", mode = { "n" }, desc = "to Sentence case" },
			{ "gs<space>", mode = { "n" }, desc = "to space case" },
			{ "gs-", mode = { "n" }, desc = "to kebab-case" },
			{ "gsk", mode = { "n" }, desc = "to kebab-case" },
			{ "gsK", mode = { "n" }, desc = "to Title-Kebab-Case" },
			{ "gs.", mode = { "n" }, desc = "to dot.case" },
		},
	},
	{
		"Wansmer/treesj",
		keys = {
			{
				"<Leader>m",
				"<cmd>lua require('treesj').toggle()<CR>",
				mode = { "n" },
				desc = "trees sitter join toggle",
			},
			{
				"<Leader>J",
				"<cmd>lua require('treesj').join()<CR>",
				mode = { "n" },
				desc = "trees sitter join",
			},
			{
				"<Leader>S",
				"<cmd>lua require('treesj').split()<CR>",
				mode = { "n" },
				desc = "trees sitter split",
			},
		},
		config = function()
			require("treesj").setup({
				use_default_keymaps = false,
			})
		end,
	},
	{
		"stevearc/overseer.nvim",
		lazy = true,
		cmd = { "OverseerToggle", "OverseerRun" },
		keys = {
			{ "<Leader>oo", "<cmd>OverseerToggle<CR>", mode = "n", desc = "overseer toggle" },
			{ "<Leader>or", "<cmd>OverseerRun<CR>", mode = "n", desc = "overseer run" },
		},
		config = function()
			require("overseer").setup()
		end,
	},
	{
		"windwp/nvim-autopairs",
		lazy = true,
		event = "InsertEnter",
		opts = {
			fast_wrap = {},
			disable_filetype = { "TelescopePrompt", "vim" },
		},
		config = function(_, opts)
			require("nvim-autopairs").setup(opts)

			-- setup cmp for autopairs
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
	{
		"monaqa/dial.nvim",
		lazy = true,
		keys = {
			{ "+", "<Plug>(dial-increment)", mode = { "n" }, desc = "dial increment" },
			{ "-", "<Plug>(dial-decrement)", mode = { "n" }, desc = "dial decrement" },
		},
		config = function()
			local augend = require("dial.augend")
			require("dial.config").augends:register_group({
				-- default augends used when no group name is specified
				default = {
					augend.integer.alias.decimal, -- nonnegative decimal number (0, 1, 2, 3, ...)
					augend.integer.alias.hex, -- nonnegative hex number  (0x01, 0x1a1f, etc.)
					augend.date.alias["%Y/%m/%d"], -- date (2022/02/19, etc.)
					augend.constant.alias.bool, -- boolean value (true <-> false)
					augend.date.alias["%m/%d/%Y"], -- date (02/19/2022, etc.)
				},
			})
		end,
	},
}
