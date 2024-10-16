return {
  'stevearc/oil.nvim',
  keys = {
    { "<Leader>e", "<Cmd>Oil --float<CR>", desc = "open file tree", mode = { "n" } },
  },
  cmd = {
    "Oil",
  },
  config = function()
    require("oil").setup({
      float = {
        max_width = 120,
      },
    })
  end
}
