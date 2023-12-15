-- Flutterのコマンドバインディング
return {
  "akinsho/flutter-tools.nvim",
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
    require("flutter-tools").setup()
  end,
}
