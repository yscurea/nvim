local mappings = {
  n = {
    ["<F5>"] = { ":DapContinue<CR>", "Debug Continue" },
    ["<F10>"] = { ":DapStepOver<CR>", "Debug StepOver" },
    ["<F11>"] = { ":DapStepInto<CR>", "Debug StepInto" },
    ["<F12>"] = { ":DapStepOut<CR>", "Debug StepOut" },
    ["<Leader>dB"] = { ":DapToggleBreakpoint<CR>", "Debug ToggleBreakpoint" },
    ["<Leader>dlp"] = {
      function()
        require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
      end,
      "Set breakpoint",
    },
    ["<Leader>dr"] = {
      function()
        require("dap").repl.open()
      end,
      "repl.open",
    },
    ["<Leader>dl"] = {
      function()
        require("dap").run_last()
      end,
      "run_last",
    },
  },
}

-- debug adapter
return {
  "mfussenegger/nvim-dap",
  keys = {
    { "<F5>",        mode = "n", desc = "Continue" },
    { "<F10>",       mode = "n", desc = "StepOver" },
    { "<F11>",       mode = "n", desc = "StepInto" },
    { "<F12>",       mode = "n", desc = "StepOut" },
    { "<Leader>dB",  mode = "n", desc = "ToggleBreakpoint" },
    { "<Leader>dlp", mode = "n", desc = "Set breakpoint" },
    { "<Leader>dr",  mode = "n", desc = "repl.open" },
    { "<Leader>dl",  mode = "n", desc = "run_last" },
  },
  lazy = true,
  config = function()
    require("core.utils").load_mappings(mappings)
  end,
}
