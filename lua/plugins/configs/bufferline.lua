-- NOTE: bufferが全て表示されないときがある
require("bufferline").setup({
	options = {
		mode = "buffers",
		offsets = { {
			filetype = "NvimTree",
			text = "🌳 Nvim Tree 🌳",
			highlight = "Directory",
			text_align = "left"
		} },
		separator_style = "thick",
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level, _, _)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
		end,
	},
})

