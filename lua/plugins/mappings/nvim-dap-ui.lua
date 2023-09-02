return {
  n = {
    ["<leader>dd"] = {
      function()
        require("dapui").toggle()
      end,
      "dap UIの起動",
    },
  },
}
