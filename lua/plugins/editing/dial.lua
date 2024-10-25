return {
  "monaqa/dial.nvim",
  lazy = true,
  keys = {
    { "+", "<Plug>(dial-increment)", mode = { "n" }, desc = "dial increment" },
    { "-", "<Plug>(dial-decrement)", mode = { "n" }, desc = "dial decrement" },
  },
  config = function()
    local augend = require("dial.augend")
    require("dial.config").augends:register_group {
      default = {
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.constant.alias.bool,
        augend.date.alias["%Y/%m/%d"],
      },
    }
  end
}
