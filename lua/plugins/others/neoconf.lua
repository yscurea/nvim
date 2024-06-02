return {
  "folke/neoconf.nvim",
  lazy = true,
  cond = function()
    return vim.g.vscode == nil
  end,
  config = function()
    require("neoconf").setup({})
  end
}
