-- メモコメントを色付け、telescopeで検索可能にする
local mappings = {
  n = {
    ["<leader>fn"] = { -- find note
      "<cmd> TodoTelescope <CR>",
      "Todo検索",
    },
  },
}

return {
  "folke/todo-comments.nvim",
  cmd = "TodoTelescope",
  lazy = true,
  dependencies = { "nvim-lua/plenary.nvim" },
  init = function()
    require("core.utils").load_mappings(mappings)
  end,
  config = true,
  cond = function()
    return vim.g.vscode == nil
  end,
}
