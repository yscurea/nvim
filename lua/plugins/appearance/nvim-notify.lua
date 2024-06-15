-- 通知を出す
-- これによって操作を中断されない
return {
  "rcarriga/nvim-notify",
  lazy = true,
  event = { "UIEnter" },
  config = function()
    require("notify").setup({
      level = 2,
      background_colour = "#000000",
      render = "wrapped-compact",
      top_down = false,
      max_width = 200,
      stages = "fade",
    })
  end,
}
