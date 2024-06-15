local mappings = {
  n = {
    ["<leader>x"] = {
      function()
        require('close_buffers').delete({ type = 'this' })
      end,
      "close current buffer",
    },
    ["<leader>X"] = {
      function()
        require("close_buffers").wipe({ type = "all" })
      end,
      "close all buffer",
    },
  },
}

return {
  "kazhala/close-buffers.nvim",
  lazy = true,
  keys = { "<leader>x", "<leader>X" },
  config = function()
    require("core.utils").load_mappings(mappings)
    require("close_buffers").setup({})
  end,
}
