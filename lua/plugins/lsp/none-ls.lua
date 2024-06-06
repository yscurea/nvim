return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-lua/plenary.nvim",
  },
  lazy = true,
  config = function()
    local none_ls = require("none-ls")
    none_ls.setup()
  end
}
