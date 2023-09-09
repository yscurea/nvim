return {
  n = {
    ["<leader>x"] = {
      function()
        require("close_buffers").delete({ type = "this" })
      end,
      "現在のバッファを削除",
    },
    ["<leader>X"] = {
      function()
        require("close_buffers").wipe({ type = "all" })
      end,
      "バッファを全て削除",
    },
  },
}
