return {
  "haya14busa/vim-edgemotion",
  lazy = true,
  keys = {
    { "<Leader>J", "<Plug>(edgemotion-j)", desc = "jump edge down", mode = { "n", "v" } },
    { "<Leader>K", "<Plug>(edgemotion-k)", desc = "jump edge up",   mode = { "n", "v" } },
  },
}
