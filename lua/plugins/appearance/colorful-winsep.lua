return {
  "nvim-zh/colorful-winsep.nvim",
  event = { "WinResized" },
  config = function()
    require("colorful-winsep").setup()
  end,
}
