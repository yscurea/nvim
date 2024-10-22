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
      view_options = {
        show_hidden = true,
      },
      float = {
        max_width = 120,
      },
    })
  end
}
