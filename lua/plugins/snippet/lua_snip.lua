return {
  "L3MON4D3/LuaSnip",
  tag = "v2.3.0",
  lazy = true,
  config = function()
    local ls = require("luasnip")
    ls.setup({
      history = true,
      update_events = "TextChanged, TextChangedI",
    })
  end,
}
