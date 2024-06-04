return {
  'kevinhwang91/nvim-bqf',
  lazy = true,
  ft = { "qf" },
  config = function()
    require("nvim-bqf").setup()
  end,
}
