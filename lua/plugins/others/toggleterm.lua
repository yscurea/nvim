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
    ["<A-l>"] = { "<cmd>ToggleTerm direction=vertical size=90<CR>", "画面右にターミナルを開く" },
    ["<A-f>"] = { "<cmd>ToggleTerm direction=float size=80<CR>", "画面中央にターミナルを開く" },
    ["<A-j>"] = { "<Esc><cmd>ToggleTerm direction=horizontal size=20<CR>", "画面下にターミナルを開く" },
    ["<A-i>"] = { "<Esc><cmd>ToggleTerm direction=float size=15<CR>", "画面中央にターミナルを開く" },
    ["<A-g>"] = { "<cmd>lua GitUIToggle()<CR>", "gitui" },
  },
  i = {
    ["<A-l>"] = { "<cmd>ToggleTerm direction=vertical size=90<CR>", "画面右にターミナルを開く" },
    ["<A-f>"] = { "<cmd>ToggleTerm direction=float size=80<CR>", "画面中央にターミナルを開く" },
    ["<A-j>"] = { "<Esc><cmd>ToggleTerm direction=horizontal size=20<CR>", "画面下にターミナルを開く" },
    ["<A-i>"] = { "<Esc><cmd>ToggleTerm direction=float size=15<CR>", "画面中央にターミナルを開く" },
    ["<A-g>"] = { "<cmd>lua GitUIToggle()<CR>", "gitui" },
  },
  t = {
    ["<A-l>"] = { "<cmd>ToggleTerm direction=vertical size=90<CR>", "画面右にターミナルを開く" },
    ["<A-f>"] = { "<cmd>ToggleTerm direction=float size=80<CR>", "画面中央にターミナルを開く" },
    ["<A-i>"] = { "<Esc><cmd>ToggleTerm direction=float size=15<CR>", "画面中央にターミナルを開く" },
    ["<A-g>"] = { "<cmd>lua GitUIToggle()<CR>", "gitui" },
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
    require("toggleterm").setup{
      float_opts = {
        border = 'double',
        width = 100,
      },
    }
  end,
  lazy = true,
}
