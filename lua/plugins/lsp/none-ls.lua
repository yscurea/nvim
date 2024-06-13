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
    local sources = {}
    -- custom filetypes
    -- null_ls.builtins.formatting.prettier.with({
    --     filetypes = { "html", "json", "yaml", "markdown" },
    -- })
    -- custom args
    -- null_ls.builtins.formatting.shfmt.with({
    --     extra_args = { "-i", "2", "-ci" },
    -- }),
    if vim.fn.executable("markdownlint") == 1 then
      -- npm install -g markdownlint-cli
      table.insert(sources, null_ls.builtins.formatting.markdownlint)
    end
    if vim.fn.executable("mypy") == 1 then
      table.insert(sources, null_ls.builtins.diagnostics.mypy)
    end
    null_ls.setup({ sources = sources })
  end
}
