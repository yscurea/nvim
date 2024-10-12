-- LSPではないものをNeovimのLSPに注入してLSPのように動かすため
return {
  "nvimtools/none-ls.nvim",
  lazy = true,
  event = "BufReadPost",
  config = function()
    local null_ls = require("null-ls")
    local sources = {}
    null_ls.setup({ sources = sources })
  end
}
