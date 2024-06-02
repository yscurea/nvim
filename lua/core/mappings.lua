local mappings = {
	i = {
		["jj"] = { "<ESC>", "Escape" },
		["jk"] = { "<Esc>", "Escape" },
		["kk"] = { "<Esc>", "Escape" },
		["kj"] = { "<Esc>", "Escape" },
	},
	n = {
		["<ESC>"] = { ":noh<CR>", "no highlight" },

		["<Leader>ww"] = { ":w<CR>", "save file" },
		["<Leader>wa"] = { ":wa<CR>", "save all files" },
		["<Leader>q"] = { ":q<CR>", "close window" },
		["yd"] = { '"_d', "d without yank" },
		["yc"] = { '"_c', "c without yank" },

		-- Fold command
		["s"] = { "<Nop>", "" },
		["so"] = { "zo", "open fold" },
		["sO"] = { "zO", "open all fold" },
		["sa"] = { "zo", "tmp toggle fold" },
		["sA"] = { "zO", "tmp toggle all fold" },
		["sm"] = { "zm", "close fold" },
		["sM"] = { "zM", "close all fold" },

		-- window operation. Use 'r' key instead of 's', if you want to use replace key.
		["ss"] = { ":sp<CR>", "horizontal split window" },
		["sv"] = { ":vs<CR>", "vertical split window" },
		["sJ"] = { "<C-w>J", "window move to down" },
		["sK"] = { "<C-w>K", "window move to up" },
		["sL"] = { "<C-w>L", "window move to right" },
		["sH"] = { "<C-w>H", "window move to left" },
		["sj"] = { "<C-w>j", "cursor move to down window" },
		["sk"] = { "<C-w>k", "cursor move to up window" },
		["sl"] = { "<C-w>l", "cursor move to right window" },
		["sh"] = { "<C-w>h", "cursor move to left window" },
		["s>"] = { "<C-w>>", "window extend horizontal" },
		["s<"] = { "<C-w><", "window contract horizontal" },
		["s+"] = { "<C-w>+", "window extend vertical" },
		["s-"] = { "<C-w>-", "window contract vertical" },
		["s="] = { "<C-w>=", "window equal" },
		["s_"] = { "<C-w>_", "window max vertical" },
		["s|"] = { "<C-w>|", "window max horizontal" },
		["sc"] = { "<C-w>c", "window close" },
		["sn"] = { "<C-w>w", "window next" },
		["sp"] = { "<C-w>W", "window previous" },

		["<C-j>"] = { "+", "Move cursor next line start" },
		["<C-k>"] = { "-", "Move cursor prev line start" },
		["zj"] = { "zt", "Cursor top with scroll" },
		["zk"] = { "zb", "Cursor bottom with scroll" },
		-- ["+"] = { "<C-a>", "Increment" },
		-- ["-"] = { "<C-x>", "Decrement" },
		["<Leader>re"] = { ":%s;\\<<C-R><C-W>\\>;g<Left><Left>;", "Replace" },
		["<Leader>p"] = { '"0p', "paste 0 register" },
		["<Leader>P"] = { '"0P', "paste 0 register" },
		["<Leader><Leader>"] = { "<C-^>", "Toggle between previous file and current file." },
		["<Leader>n"] = { ":cnext<CR>", "Next quickfix." },
		["<Leader>N"] = { ":cprevious<CR>", "Previous quickfix." },
		["<Right>"] = { "10j", "10j" },
		["<Left>"] = { "10k", "10k" },
	},
	v = {
		["<Leader>p"] = { '"0p', "paste 0 register" },
		["<Leader>P"] = { '"0P', "paste 0 register" },
		["+"] = { "<C-a>", "Increment" },
		["-"] = { "<C-x>", "Decrement" },
		["zj"] = { "zt", "cursor top with scroll" },
		["zk"] = { "zb", "cursor bottom with scroll" },
		["<C-j>"] = { "+", "move cursor next line start" },
		["<C-k>"] = { "-", "move cursor prev line start" },
		["<Right>"] = { "10j", "10j" },
		["<Left>"] = { "10k", "10k" },
	},
	t = {
		["<A-j>"] = { "<C-\\><C-n>", "terminal normal mode" },
	},
	o = {
		["("] = { "i(", "inner ()" }, -- ))
		['"'] = { 'i"', 'inner""' }, -- ""
		["'"] = { "i'", "inner''" }, -- ''
		["@"] = { "i`", "inner``" }, -- ``
		["["] = { "i[", "inner[]" }, -- ]]
		["{"] = { "i{", "inner{}" }, -- }}
	},
}

require("core.utils").load_mappings(mappings)
