return {
  "tpope/vim-surround",
  lazy = true,
  keys = {
    { "ds",  mode = { "n" }, desc = "delete surround" },
    { "cs",  mode = { "n" }, desc = "change surround" },
    { "cS",  mode = { "n" }, desc = "change surround" },
    { "ys",  mode = { "n" }, desc = "attach surround" },
    { "yS",  mode = { "n" }, desc = "attach surround" },
    { "yss", mode = { "n" }, desc = "attach surround line" },
    { "ySS", mode = { "n" }, desc = "attach surround line updown" },
  },
}
