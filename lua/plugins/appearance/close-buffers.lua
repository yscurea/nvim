return {
  "kazhala/close-buffers.nvim",
  lazy = true,
  keys = {
    {
      "<Leader>x",
      function()
        require('close_buffers').delete({ type = 'this' })
      end,
      mode = "n",
      desc = "Close current buffer",
    },
    {
      "<Leader>cc",
      function()
        require('close_buffers').delete({ type = 'this' })
      end,
      mode = "n",
      desc = "Close current buffer",
    },
    {
      "<Leader>ca",
      function()
        require('close_buffers').delete({ type = 'all' })
      end,
      mode = "n",
      desc = "Close all buffers",
    },
    {
      "<Leader>co",
      function()
        require('close_buffers').delete({ type = 'other' })
      end,
      mode = "n",
      desc = "Close others buffers",
    },
  },
  config = function()
    require("close_buffers").setup({})
  end,
}
