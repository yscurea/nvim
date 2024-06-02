local mappings = {
  n = {
    ["<Leader>z"] = { ":ZenMode<CR>", "禅" },
  }
}

return {
  "folke/zen-mode.nvim",
  lazy = true,
  cmd = { "ZenMode" },
  init = function()
    require("core.utils").load_mappings(mappings)
  end,
}
