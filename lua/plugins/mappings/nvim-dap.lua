return {
  n = {
    ['<F5>'] = {':DapContinue<CR>', "デバッグ実行"},
    ['<F10>'] = {':DapStepOver<CR>', ""},
    ['<F11>'] = {':DapStepInto<CR>', ""},
    ['<F12>'] = {':DapStepOut<CR>', ""},
    ['<leader>B']= {':DapToggleBreakpoint<CR>', ""},
    ["<leader>BB"]= {
      function ()
       require("dap").set_breakpoint(nil, nil, vim.fn.input("Breakpoint condition: "))
      end,
      "ブレークポイントセット"
    },
    ['<leader>lp'] = {
      function ()
        require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
      end,
      "ブレークポイントセット"
    },
    ['<leader>dr'] = {
      function ()
        require("dap").repl.open()
      end,
      "repl.open"
    },
    ['<leader>dl'] = {
      function ()
        require("dap").run_last()
      end,
      "run_last"
    },
  }
}
