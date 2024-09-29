-- コメントで書かれたメモの検索、見やすさなど
return {
  "folke/todo-comments.nvim",
  lazy = true,
  cmd = "TodoTelescope",
  keys = {
    { "<Leader>fn", "<cmd> TodoTelescope <CR>", desc = "find note", mode = "n" },
  },
  config = true,
}
