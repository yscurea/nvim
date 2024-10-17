function GitUIToggle()
  local Terminal = require("toggleterm.terminal").Terminal
  local gitui = Terminal:new({
    cmd = "gitui",
    direction = "float",
    hidden = true,
    count = 10,
    float_opts = {
      width = function()
        return math.floor(vim.o.columns * 0.9)
      end,
    }
  })
  gitui:toggle()
end

local mappings = {
  n = {
    ["<A-l>"] = { "<cmd>ToggleTerm direction=vertical size=90<CR>", "Open right terminal" },
    ["<A-f>"] = { "<cmd>ToggleTerm direction=float size=80<CR>", "Open center terminal" },
    ["<A-j>"] = { "<Esc><cmd>ToggleTerm direction=horizontal size=20<CR>", "Open bottom terminal" },
    ["<A-g>"] = { "<cmd>lua GitUIToggle()<CR>", "Open gitui terminal" },
  },
  i = {
    ["<A-l>"] = { "<cmd>ToggleTerm direction=vertical size=90<CR>", "Open right terminal" },
    ["<A-f>"] = { "<cmd>ToggleTerm direction=float size=80<CR>", "Open center terminal" },
    ["<A-j>"] = { "<Esc><cmd>ToggleTerm direction=horizontal size=20<CR>", "Open bottom terminal" },
    ["<A-g>"] = { "<cmd>lua GitUIToggle()<CR>", "Open gitui terminal" },
  },
  t = {
    ["<A-l>"] = { "<cmd>ToggleTerm direction=vertical size=90<CR>", "Open right terminal" },
    ["<A-f>"] = { "<cmd>ToggleTerm direction=float size=80<CR>", "Open center terminal" },
    ["<A-j>"] = { "<Esc><cmd>ToggleTerm direction=horizontal size=20<CR>", "Open bottom terminal" },
    ["<A-g>"] = { "<cmd>lua GitUIToggle()<CR>", "Open gitui terminal" },
  },
}

return {
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = { "<Leader>g" },
  cmd = { "ToggleTerm" },
  init = function()
    require("core.utils").load_mappings(mappings)
  end,
  config = function()
    require("toggleterm").setup {
      float_opts = {
        border = 'double',
        width = 100,
      },
    }
  end,
  lazy = true,
}
