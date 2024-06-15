-- 加速jk
return {
  "rhysd/accelerated-jk",
  lazy = true,
  event = "CursorMoved",
  keys = {
    { "j", "<Plug>(accelerated_jk_j)", mode = { "n" }, desc = "accelerated j with long press" },
    { "k", "<Plug>(accelerated_jk_k)", mode = { "n" }, desc = "accelerated k with long press" },
  },
}
