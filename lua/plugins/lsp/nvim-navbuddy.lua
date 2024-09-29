local mappings = {
  n = {
    -- find symbol
    ["<Leader>fs"] = { "<cmd>Navbuddy<CR>", "find symbols" },
  },
}

-- バッファ内シンボルの検索
return {
  "SmiteshP/nvim-navbuddy",
  lazy = true,
  event = { "LspAttach" },
  cmd = { "Navbuddy" },
  config = function()
    require("core.utils").load_mappings(mappings)
    require("nvim-navbuddy").setup({
      lsp = { auto_attach = true }
    })
  end,
}
