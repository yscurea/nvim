-- キーマップのヒント表示
local mappings = {
  n = {
    ["<Leader>wK"] = {
      "<cmd>WhichKey<CR>",
      "Which-key all keymaps",
    },
    ["<Leader>wk"] = {
      function()
        local input = vim.fn.input("WhichKey: ")
        vim.cmd("WhichKey " .. input)
      end,
      "Which-key query lookup",
    },
  },
}

return {
  "folke/which-key.nvim",
  lazy = true,
  keys = {
    "<Leader>",
    '"',
    "'",
    "`",
    "c",
    "d",
    "y",
    "g",
    "z",
  },
  init = function()
    require("core.utils").load_mappings(mappings)
  end,
  config = function()
    require("which-key").setup({})
  end,
}
