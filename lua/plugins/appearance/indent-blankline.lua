-- インデントとか終端文字とかの表示の調節する
return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  lazy = true,
  opts = {
    enabled = true,
    exclude = {
      filetypes = {
        "help",
        "terminal",
        "lazy",
        "lspinfo",
        "TelescopePrompt",
        "TelescopeResults",
        "",
      },
      buftypes = { "terminal" },
    },
    whitespace = {
      remove_blankline_trail = true,
    },
    scope = {
      show_start = false,
    },
  },
  event = "VimEnter",
}
