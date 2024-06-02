return {
  "catppuccin/nvim",
  lazy = true,
  name = "catppuccin",
  cond = function()
    return vim.g.vscode == nil
  end,
  -- priority = 1000,
  -- config = function()
  --   vim.cmd([[colorscheme catppuccin-frappe]])
  -- end,
}
