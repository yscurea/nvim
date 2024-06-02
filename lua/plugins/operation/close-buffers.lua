local mappings = {
  n = {
    ["<leader>x"] = {
      function()
        require('close_buffers').delete({ type = 'this' })
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

return {
  "kazhala/close-buffers.nvim",
  lazy = true,
  keys = { "<leader>x", "<leader>X" },
  cond = function()
    return vim.g.vscode == nil
  end,
  config = function()
    require("core.utils").load_mappings(mappings)
    require("close_buffers").setup({})
  end,
}
