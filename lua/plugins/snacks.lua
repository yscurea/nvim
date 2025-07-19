---@diagnostic disable: undefined-global
---@type LazySpec[]
return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		animate = {
			duration = 20,
			easing = "linear",
			fps = 60,
		},
		bigfile = { enabled = true },
		dashboard = { enabled = true },
		explorer = { enabled = false },
		indent = { enabled = true },
		input = { enabled = true },
		notifier = {
			enabled = true,
			timeout = 3000,
		},
		picker = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = {
			enabled = false,
			animate = {
				duration = { step = 15, total = 100 },
				easing = "linear",
			},
		},
		statuscolumn = { enabled = true },
		words = { enabled = true },
		styles = {
			notification = {
				wo = { wrap = true },
			},
		},
	},
	keys = {
		{
			"<leader>X",
			function()
				Snacks.bufdelete()
			end,
			desc = "buffer delete",
		},
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>fw",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>fB",
			function()
				Snacks.picker.grep_buffers()
			end,
			desc = "Grep Open Buffers",
		},
		{
			"<leader>fch",
			function()
				Snacks.picker.command_history()
			end,
			desc = "Command History",
		},
		{
			"<leader>fcm",
			function()
				Snacks.picker.commands()
			end,
			desc = "Commands",
		},
		{
			"<leader>fcs",
			function()
				Snacks.picker.colorschemes()
			end,
			desc = "Colorschemes",
		},
		{
			"<leader>fn",
			function()
				Snacks.picker.notifications()
			end,
			desc = "Notification History",
		},
		{
			"<leader>fe",
			function()
				Snacks.explorer()
			end,
			desc = "File Explorer",
		},
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>fp",
			function()
				Snacks.picker.projects()
			end,
			desc = "Projects",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.recent()
			end,
			desc = "Recent",
		},
		{
			"<leader>fR",
			function()
				Snacks.picker.resume()
			end,
			desc = "Resume",
		},
		{
			"<leader>fl",
			function()
				Snacks.picker.lines()
			end,
			desc = "Buffer Lines",
		},
		{
			"<leader>fL",
			function()
				Snacks.picker.loclist()
			end,
			desc = "Location List",
		},
		{
			'<leader>f"',
			function()
				Snacks.picker.registers()
			end,
			desc = "Registers",
		},
		{
			"<leader>f/",
			function()
				Snacks.picker.search_history()
			end,
			desc = "Search History",
		},
		{
			"<leader>fa",
			function()
				Snacks.picker.autocmds()
			end,
			desc = "Autocmds",
		},
		{
			"<leader>fd",
			function()
				Snacks.picker.diagnostics_buffer()
			end,
			desc = "Buffer Diagnostics",
		},
		{
			"<leader>fD",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "Diagnostics",
		},
		{
			"<leader>fh",
			function()
				Snacks.picker.help()
			end,
			desc = "Help Pages",
		},
		{
			"<leader>fH",
			function()
				Snacks.picker.highlights()
			end,
			desc = "Highlights",
		},
		{
			"<leader>fI",
			function()
				Snacks.picker.icons()
			end,
			desc = "Icons",
		},
		{
			"<leader>fJ",
			function()
				Snacks.picker.jumps()
			end,
			desc = "Jumps",
		},
		{
			"<leader>fK",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "Keymaps",
		},
		{
			"<leader>fm",
			function()
				Snacks.picker.marks()
			end,
			desc = "Marks",
		},
		{
			"<leader>fM",
			function()
				Snacks.picker.man()
			end,
			desc = "Man Pages",
		},
		{
			"<leader>fq",
			function()
				Snacks.picker.qflist()
			end,
			desc = "Quickfix List",
		},
		{
			"<leader>fu",
			function()
				Snacks.picker.undo()
			end,
			desc = "Undo History",
		},
		{
			"<leader>fs",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "LSP Symbols",
		},
		{
			"<leader>fS",
			function()
				Snacks.picker.lsp_workspace_symbols()
			end,
			desc = "LSP Workspace Symbols",
		},
		{
			"<leader>cR",
			function()
				Snacks.rename.rename_file()
			end,
			desc = "Rename File",
		},
		{
			"<leader>GG",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>hi",
			function()
				Snacks.notifier.hide()
			end,
			desc = "Dismiss All Notifications",
		},
		{
			"<leader>Z",
			function()
				Snacks.zen()
			end,
			desc = "Toggle Zen Mode",
		},
		{
			"gd",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "Goto Definition",
		},
		{
			"gD",
			function()
				Snacks.picker.lsp_declarations()
			end,
			desc = "Goto Declaration",
		},
		{
			"gr",
			function()
				Snacks.picker.lsp_references()
			end,
			desc = "References",
			nowait = true,
		},
		{
			"gi",
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = "Goto Implementation",
		},
		{
			"gy",
			function()
				Snacks.picker.lsp_type_definitions()
			end,
			desc = "Goto T[y]pe Definition",
		},
	},
	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				-- Setup some globals for debugging (lazy-loaded)
				_G.dd = function(...)
					Snacks.debug.inspect(...)
				end
				_G.bt = function()
					Snacks.debug.backtrace()
				end
				vim.print = _G.dd -- Override print to use snacks for `:=` command

				-- Create some toggle mappings
				Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
				Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
				Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
				Snacks.toggle.diagnostics():map("<leader>ud")
				Snacks.toggle.line_number():map("<leader>ul")
				Snacks.toggle
					.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
					:map("<leader>uc")
				Snacks.toggle.treesitter():map("<leader>uT")
				Snacks.toggle
					.option("background", { off = "light", on = "dark", name = "Dark Background" })
					:map("<leader>ub")
				Snacks.toggle.inlay_hints():map("<leader>uh")
				Snacks.toggle.indent():map("<leader>ug")
				Snacks.toggle.dim():map("<leader>uD")
			end,
		})
	end,
}
