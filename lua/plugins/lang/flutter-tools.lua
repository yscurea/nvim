return {
	"akinsho/flutter-tools.nvim",
	lazy = true,
	ft = { "dart" },
	cmd = {
		"FlutterRun",
		"FlutterDevices",
		"FlutterEmulators",
		"FlutterReload",
		"FlutterRestart",
		"FlutterQuit",
		"FlutterDetach",
		"FlutterOutlineToggle",
		"FlutterOutlineOpen",
		"FlutterDevTools",
		"FlutterCopyProfilerUrl",
		"FlutterLspRestart",
		"FlutterSuper",
		"FlutterReanalyze",
	},
	config = function()
		require("flutter-tools").setup({
			decorations = {
				statusline = {
					app_version = true,
					device = true,
				},
			},
			widget_guides = {
				enabled = true,
			},
			debugger = {
				enabled = true,
				exception_breakpoints = {},
				evaluate_to_string_in_debug_views = false,
			},
			dev_log = {
				enabled = true,
				open_cmd = "tabedit",
			},
			lsp = {
				color = { enabled = true },
				settings = {
					showTodos = false,
					completeFunctionCalls = true,
					renameFilesWithClasses = "prompt",
					enableSnippets = true,
				},
			},
		})
		local dap = require("dap")
		local flutterBin = vim.fn.resolve(vim.fn.exepath("flutter.bat"))
		dap.adapters.dart = {
			type = "executable",
			command = vim.fn.exepath("cmd.exe"),
			args = { "/c", flutterBin, "debug_adapter" },
			options = {
				detached = false,
			},
		}
	end,
}
