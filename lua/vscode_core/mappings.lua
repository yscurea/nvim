return {
	n = {
		["<Leader>ww"] = {
			function()
				require("vscode-neovim").call("workbench.action.files.save")
			end,
			"save file",
		},
		["<Leader>wa"] = {
			function()
				require("vscode-neovim").call("workbench.action.files.saveFiles")
			end,
			"save file",
		},
		["<Leader>q"] = {
			function()
				require("vscode-neovim").call("workbench.action.closeActiveEditor")
			end,
			"close current buffer",
		},

		["<Leader>fJ"] = {
			function()
				require("vscode-neovim").call("editor.action.marker.nextInFiles")
			end,
			"next lsp error",
		},
		["<Leader>fK"] = {
			function()
				require("vscode-neovim").call("editor.action.marker.prevInFiles")
			end,
			"previous lsp error",
		},
		["<Leader>fj"] = {
			function()
				require("vscode-neovim").call("editor.action.marker.next")
			end,
			"next lsp error",
		},
		["<Leader>fk"] = {
			function()
				require("vscode-neovim").call("editor.action.marker.prev")
			end,
			"previous lsp error",
		},

		["<Leader>_d"] = { '"_d', "ヤンクせずに削除" },
		["<Leader>_c"] = { '"_c', "ヤンクせずに削除" },

		["<Leader>fs"] = {
			function()
				require("vscode-neovim").call("workbench.action.gotoSymbol")
			end,
			"find symbol",
		},
		["<Leader>ff"] = {
			function()
				require("vscode-neovim").call("workbench.action.quickOpen")
			end,
			"find files",
		},
		["<Leader>ft"] = {
			function()
				require("vscode-neovim").call("workbench.actions.view.problems")
			end,
			"find trouble",
		},
		["<Leader>fd"] = {
			function()
				require("vscode-neovim").call("workbench.debug.action.toggleRepl")
			end,
			"find debug log",
		},
		["<Leader>fw"] = {
			function()
				require("vscode-neovim").call("workbench.view.search")
			end,
			"find word",
		},
		["<Leader>e"] = {
			function()
				require("vscode-neovim").call("workbench.files.action.focusFilesExplorer")
			end,
			"open explorer",
		},
		["<Leader>E"] = {
			function()
				require("vscode-neovim").call("workbench.action.toggleSidebarVisibility")
			end,
			"toggle explorer",
		},
		["<Leader>x"] = {
			function()
				require("vscode-neovim").call("workbench.action.closeActiveEditor")
			end,
			"close current buffer",
		},
		["<Leader>X"] = {
			function()
				require("vscode-neovim").call("workbench.action.closeAllEditors")
			end,
			"close all buffer",
		},
		["<Leader>cc"] = {
			function()
				require("vscode-neovim").call("workbench.action.closeActiveEditor")
			end,
			"close other editors",
		},
		["<Leader>co"] = {
			function()
				require("vscode-neovim").call("workbench.action.closeOtherEditors")
			end,
			"close other editors",
		},
		["ga"] = {
			function()
				require("vscode-neovim").call("editor.action.quickFix")
			end,
			"open code action",
		},
		["so"] = { "zo", "open fold" },
		["sO"] = { "zO", "open all fold" },
		["sa"] = { "zo", "tmp toggle fold" },
		["sA"] = { "zO", "tmp toggle all fold" },
		["sm"] = { "zm", "close fold" },
		["sM"] = { "zM", "close all fold" },

		["ss"] = {
			function()
				require("vscode-neovim").call("workbench.action.splitEditorDown")
			end,
			"horizontal split window",
		},
		["sv"] = {
			function()
				require("vscode-neovim").call("workbench.action.splitEditorRight")
			end,
			"vertical split window",
		},
		["sj"] = {
			function()
				require("vscode-neovim").call("workbench.action.focusBelowGroup")
			end,
			"cursor move to down window",
		},
		["sk"] = {
			function()
				require("vscode-neovim").call("workbench.action.focusAboveGroup")
			end,
			"cursor move to up window",
		},
		["sl"] = {
			function()
				require("vscode-neovim").call("workbench.action.focusRightGroup")
			end,
			"cursor move to right window",
		},
		["sh"] = {
			function()
				require("vscode-neovim").call("workbench.action.focusLeftGroup")
			end,
			"cursor move to left window",
		},
		["sn"] = {
			function()
				require("vscode-neovim").call("workbench.action.moveEditorToNextGroup")
			end,
			"window next",
		},
		["sp"] = {
			function()
				require("vscode-neovim").call("workbench.action.moveEditorToPreviousGroup")
			end,
			"window prev",
		},
		["sL"] = {
			function()
				require("vscode-neovim").call("workbench.action.moveEditorToPreviousGroup")
			end,
			"window move to right",
		},
		["sH"] = {
			function()
				require("vscode-neovim").call("workbench.action.moveEditorToNextGroup")
			end,
			"window move to left",
		},
		["<Leader>z"] = {
			function()
				require("vscode-neovim").call("workbench.action.toggleZenMode")
			end,
			"zen mode",
		},
		["<Leader>>"] = {
			function()
				require("vscode-neovim").call("workbench.action.moveEditorRightInGroup")
			end,
			"pre",
		},
		["<Leader><"] = {
			function()
				require("vscode-neovim").call("workbench.action.moveEditorLeftInGroup")
			end,
			"pre",
		},
		["<Tab>"] = {
			function()
				require("vscode-neovim").call("workbench.action.nextEditorInGroup")
			end,
			"next",
		},
		["<S-Tab>"] = {
			function()
				require("vscode-neovim").call("workbench.action.previousEditorInGroup")
			end,
			"previous",
		},
		["<C-j>"] = { "+", "move cursor next line start" },
		["<C-k>"] = { "-", "move cursor prev line start" },
		["zj"] = {
			':call VSCodeExtensionNotify("reveal", "top", 0)<CR>',
			"cursor top with scroll",
		},
		["zk"] = {
			':call VSCodeExtensionNotify("reveal", "bottom", 0)<CR>',
			"cursor bottom with scroll",
		},
		["+"] = { "<C-a>", "Increment" },
		["-"] = { "<C-x>", "Decrement" },
		["<Leader>re"] = { ":%s;\\<<C-R><C-W>\\>;g<Left><Left>;", "Replace" },
		["<Leader>p"] = { '"0p', "paste 0 register" },
		["<Leader>P"] = { '"0P', "paste 0 register" },
		["<Leader><Leader>"] = { "<C-^>", "Toggle between previous file and current file." },
		["<Leader>n"] = { ":cnext<CR>", "Next quickfix." },
		["<Leader>N"] = { ":cprevious<CR>", "Next quickfix." },
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
}
