return {
  "folke/trouble.nvim",
  lazy = true,
  cmd = { "Trouble" },
  keys = {
    { "<Leader>ftd", "<cmd> Trouble diagnostics <CR>", desc = "Open Problems by diagnostics", mode = "n" },
    { "<Leader>ftl", "<cmd> Trouble lsp <CR>",         desc = "Open Problems by lsp",         mode = "n" },
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
