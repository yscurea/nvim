-- スクロールバーの表示
return {
  "petertriho/nvim-scrollbar",
  lazy = true,
  keys = {
    { "<Leader>sh", ":ScrollbarShow<CR>",   mode = "n", desc = "Toggle scrollbar" },
    { "<Leader>st", ":ScrollbarToggle<CR>", mode = "n", desc = "Toggle scrollbar" },
  },
  cmd = {
    "ScrollbarShow",
    "ScrollbarHide",
    "ScrollbarToggle",
  },
  dependencies = {
    { "kevinhwang91/nvim-hlslens" },
    { "lewis6991/gitsigns.nvim" },
  },
  config = function()
    require("gitsigns").setup({})
    require("scrollbar").setup({})
    require("scrollbar.handlers.gitsigns").setup({})
    require("scrollbar.handlers.search").setup({})
  end,
}
