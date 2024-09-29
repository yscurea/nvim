-- LSP機能に関するUI強化
return {
  "nvimdev/lspsaga.nvim",
  lazy = true,
  cmd = { "Lspsaga" },
  config = function()
    require("lspsaga").setup({})
  end,
}
