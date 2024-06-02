-- カーソル以下と同じ単語をハイライト
return {
  "RRethy/vim-illuminate",
  event = "CursorMoved",
  lazy = true,
  cond = function()
    return vim.g.vscode == nil
  end,
}
