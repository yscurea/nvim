---@type LazySpec[]
return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    config = function()
      require("conform").setup({
        async = true,
        default_format_opts = {
          lsp_format = "fallback",
        },
        format_on_save = {
          lsp_format = "fallback",
          timeout_ms = 3000,
        },
        formatters_by_ft = {
          lua = { "stylua" },
          json = { "biome" },
        },
        formatters = {
          gofmt = {
            append_args = { "-s" },
          },
        },
      })
    end,
  },
}
