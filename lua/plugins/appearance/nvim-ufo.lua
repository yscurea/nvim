return {
  "kevinhwang91/nvim-ufo",
  lazy = true,
  event = "BufReadPre",
  init = function()
    vim.o.fillchars = [[eob: ,fold: ,foldopen:+,foldsep: ,foldclose:-]]
    vim.o.foldcolumn = "1"
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
  end,
  config = function()
    require("ufo").setup({
      provider_selector = function(_, _, _)
        return { "treesitter", "indent" }
      end
    })
  end,
}
