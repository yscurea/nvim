return {
  "MunifTanjim/prettier.nvim",
  event = "LspAttach",
  ft = "md",
  dependencies = {
    "neovim/nvim-lspconfig",
    "jose-elias-alvarez/null-ls.nvim",
  },
  config = true,
}
