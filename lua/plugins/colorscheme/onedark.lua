return {
  "olimorris/onedarkpro.nvim",
  lazy = true,
  cond = function()
    return vim.g.vscode == nil
  end,
  -- priority = 1000,
  -- config = function()
  --   vim.cmd([[colorscheme onedark]])
  -- end,
}
