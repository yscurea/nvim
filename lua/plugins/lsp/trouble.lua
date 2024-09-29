-- コードの問題点を一覧で表示

return {
  "folke/trouble.nvim",
  lazy = true,
  cmd = { "Trouble" },
  keys = {
    { "<Leader>ftd", "<cmd> Trouble diagnostics <CR>", desc = "問題一覧ウィンドウを開く", mode = "n" },
    { "<Leader>ftl", "<cmd> Trouble lsp <CR>", desc = "問題一覧ウィンドウを開く", mode = "n" },
  },
  config = function()
    require("trouble").setup({
      modes = {
        symbols = {
          position = "right",
        }
      },
      width = 100,
    })
  end,
}
