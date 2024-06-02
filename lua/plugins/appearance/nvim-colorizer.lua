-- カラーコードなどを色づけしてくれる
return {
  "norcalli/nvim-colorizer.lua",
  cmd = "ColorizerToggle",
  lazy = true,
  config = true,
  cond = function()
    return vim.g.vscode == nil
  end,
}
