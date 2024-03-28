-- Flutterのコマンドバインディング
return {
  "akinsho/flutter-tools.nvim",
  ft = {
    "dart"
  },
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
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local navic = require("nvim-navic")
    local navbuddy = require("nvim-navbuddy")

    local on_attach = function(client, bufnr)
      navic.attach(client, bufnr)
      navbuddy.attach(client, bufnr)
    end

    require("flutter-tools").setup({
      decorations = {
        statusline = {
          -- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
          -- this will show the current version of the flutter app from the pubspec.yaml file
          app_version = true,
          -- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
          -- this will show the currently running device if an application was started with a specific
          -- device
          device = true,
        },
      },
      widget_guides = {
        enabled = true,
      },
      debugger = {           -- integrate with nvim dap + install dart code debugger
        enabled = true,
        run_via_dap = false, -- use dap instead of a plenary job to run flutter apps
      },
      dev_log = {
        enabled = true,
        open_cmd = "10sp", -- command to use to open the log buffer
      },
      lsp = {
        color = { enabled = true },
        on_attach = on_attach,
        settings = {
          showTodos = false,
          completeFunctionCalls = true,
          renameFilesWithClasses = "prompt",
          enableSnippets = true,
        },
      },
    })
  end,
}
