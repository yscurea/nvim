local mappings = {
  n = {
    -- find symbol
    ["<Leader>fs"] = { "<cmd>Navbuddy<CR>", "シンボル一覧" },
  },
}

return {
  "SmiteshP/nvim-navbuddy",
  dependencies = {
    "SmiteshP/nvim-navic",
    "MunifTanjim/nui.nvim",
  },
  lazy = true,
  cond = function()
    return vim.g.vscode == nil
  end,
  opts = { lsp = { auto_attach = true } },
  config = function()
    require("core.utils").load_mappings(mappings)
  end
}
