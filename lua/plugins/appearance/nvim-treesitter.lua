-- 構文解析によるハイライト

-- INFO:
-- dependencies gcc
-- scoop install gcc : on windows

local options = {
  ensure_installed = { "lua" },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = { enable = true },
}

return {
  "nvim-treesitter/nvim-treesitter",
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  build = ":TSUpdate",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("nvim-treesitter.configs").setup(options)
  end,
}
