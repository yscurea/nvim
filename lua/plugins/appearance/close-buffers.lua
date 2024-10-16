return {
  "kazhala/close-buffers.nvim",
  lazy = true,
  keys = {
    {
      "<leader>x",
      function()
        require('close_buffers').delete({ type = 'this' })
      end,
      mode = "n",
      desc = "Close current buffer",
    },
    {
      "<leader>X",
      function()
        require('close_buffers').delete({ type = 'this' })
      end,
      mode = "n",
      desc = "Close all buffers",
    },
  },
  config = function()
    require("close_buffers").setup({})
  end,
}
