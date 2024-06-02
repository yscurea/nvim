return {
	"mfussenegger/nvim-dap-python",
	ft = "python",
	config = function()
		vim.lsp.enable({
			"ruff",
			"ty",
		})
		require("dap-python").setup("uv")

		table.insert(require("dap").configurations.python, {
			type = "python",
			request = "launch",
			name = "My custom launch configuration",
			program = "${file}",
		})
	end,
}
