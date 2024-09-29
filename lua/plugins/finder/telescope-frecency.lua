return {
  "nvim-telescope/telescope-frecency.nvim",
  lazy = true,
  keys = {
    { "<Leader>fr", "<cmd> Telescope frecency <CR>", desc = "find word", mode = "n" },
  },
  config = function()
    require("telescope").load_extension("frecency")
  end,
}
