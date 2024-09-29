return {
  "nvim-telescope/telescope-live-grep-args.nvim",
  keys = {
    { "<Leader>fW", "<cmd> Telescope live_grep_args <CR>", desc = "find word", mode = "n" },
  },
  config = function()
    require("telescope").load_extension("live_grep_args")
  end,
}
