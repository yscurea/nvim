-- LSP機能に関するUI強化
return {
  "nvimdev/lspsaga.nvim",
  lazy = true,
  config = function()
    require("lspsaga").setup({})
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  }
}
