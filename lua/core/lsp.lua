local navbuddy = require("nvim-navbuddy")
local navic = require("nvim-navic")
require("mason")

vim.lsp.config("*", {
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	on_attach = function(client, bufnr)
		if client.server_capabilities.documentSymbolProvider then
			navic.attach(client, bufnr)
			navbuddy.attach(client, bufnr)
		end
	end,
})

vim.lsp.enable({
	-- typescript
	"denols",
	-- nil
	"nil_ls",
	-- lua
	"lua_ls",
	-- python
	"ruff",
	"ty",
})

vim.diagnostic.config({
	virtual_lines = false,
	virtual_text = true,
	underline = false,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = true,
	},
})

local mappings = {
	n = {
		["<Leader>rn"] = {
			function()
				vim.lsp.buf.rename()
			end,
			"LSP rename",
		},
		["K"] = {
			function()
				vim.lsp.buf.hover()
			end,
			"LSP hover",
		},
		["<Leader>ls"] = {
			function()
				vim.lsp.buf.signature_help()
			end,
			"LSP signature help",
		},
		["<Leader>a"] = {
			function()
				vim.lsp.buf.code_action()
			end,
			"LSP code action",
		},
		["<Leader>fj"] = {
			function()
				vim.diagnostic.jump({ count = 1, float = true })
			end,
			"Goto prev",
		},
		["<F8>"] = {
			function()
				vim.diagnostic.jump({ count = 1, float = true })
			end,
			"Goto prev",
		},
		["<Leader>fk"] = {
			function()
				vim.diagnostic.jump({ count = -1, float = true })
			end,
			"Goto next",
		},
		["<Leader>Q"] = {
			function()
				vim.diagnostic.setloclist()
			end,
			"Diagnostic setloclist",
		},
		["<Leader>FF"] = {
			function()
				vim.lsp.buf.format()
			end,
			"format",
		},
	},
}

require("core.utils").load_mappings(mappings)
