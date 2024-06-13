return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-lua/plenary.nvim",
  },
  lazy = true,
  event = "BufReadPost",
  config = function()
    local null_ls = require("null-ls")
    local sources = {
      null_ls.builtins.diagnostics.dotenv_linter,
      null_ls.builtins.diagnostics.editorconfig_checker,
      null_ls.builtins.diagnostics.mypy,
      null_ls.builtins.diagnostics.terraform_validate,
      -- null_ls.builtins.diagnostics.typos,
    }
    null_ls.setup({ sources = sources })
  end
}
