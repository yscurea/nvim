return {
  n = {
    ['<leader>d'] = {
      function()
        require("dapui").toggle()
      end,
      "dap UIの起動"
    }
  }
}
