-- 構文解析による色付けやその他機能のため
-- required gcc

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = true,
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  event = "BufReadPost",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {},
      highlight = {
        enable = true,
        use_languagetree = true,
      },
      indent = {
        enable = true,
        disable = { "dart" } -- because dart ls format too slow
      },
    })
  end,
}
