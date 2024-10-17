return {
  "akinsho/git-conflict.nvim",
  version = "v2.0.0",
  lazy = true,
  keys = { "<A-g>" },
  config = function()
    require('git-conflict').setup()
  end
}
