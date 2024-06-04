local mappings = {
  n = {
    ["<Leader>z"] = { function()
      require("zen-mode").toggle()
    end, "Toggle ZenMode" },
  }
}

return {
  "folke/zen-mode.nvim",
  lazy = true,
  keys = {
    { "<Leader>z", mode = "n", desc = "Toggle ZenMode" },
  },
  config = function()
    require("zen-mode").setup()
    require("core.utils").load_mappings(mappings)
  end,
}
