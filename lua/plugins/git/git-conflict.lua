return {
  "akinsho/git-conflict.nvim",
  version = "*",
  lazy = true,
  keys = { "<A-g>" },
  config = function()
    require('git-conflict').setup()
  end
}
