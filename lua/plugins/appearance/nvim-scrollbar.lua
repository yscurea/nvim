local mappings = {
  n = {
    ["<Leader>st"] = { ":ScrollbarToggle<CR>", "スクロールバーの表示非表示" },
  }
}

return {
  "petertriho/nvim-scrollbar",
  lazy = true,
  keys = {
    { "<leader>st", mode = "n", desc = "Toggle scrollbar" },
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
    require("core.utils").load_mappings(mappings)
    require("gitsigns").setup({})
    require("scrollbar").setup({})
    require("scrollbar.handlers.gitsigns").setup({})
    require("scrollbar.handlers.search").setup({})
  end,
  cond = function()
    return vim.g.vscode == nil
  end,
}
