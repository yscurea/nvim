return {
  "Wansmer/treesj",
  keys = {
    {
      "<Leader>m",
      "<cmd>lua require('treesj').toggle()<CR>",
      mode = { "n" },
      desc = "trees sitter join toggle",
    },
    {
      "<Leader>J",
      "<cmd>lua require('treesj').join()<CR>",
      mode = { "n" },
      desc = "trees sitter join",
    },
    {
      "<Leader>S",
      "<cmd>lua require('treesj').split()<CR>",
      mode = { "n" },
      desc = "trees sitter split",
    },
  },
  config = function()
    require('treesj').setup({
      use_default_keymaps = false,
    })
  end,
}
