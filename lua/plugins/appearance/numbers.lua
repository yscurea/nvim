return {
  "myusuf3/numbers.vim",
  event = "InsertEnter",
  lazy = true,
  init = function()
    vim.g.numbers_exclude = {
      "tagbar",
      "NvimTree",
      "nerdtree",
      "gundo",
      "minibufexpl",
      "toggleterm",
      "dashboard",
      "packer",
    }
  end,
}
