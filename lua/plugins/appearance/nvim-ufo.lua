return {
  "kevinhwang91/nvim-ufo",
  keys = { "zR", "zM" },
  dependencies = {
    'kevinhwang91/promise-async'
  },
  config = function()
    vim.o.foldcolumn = '1'
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = false
    require('ufo').setup({
      provider_selector = function(_, _, _)
        return { 'treesitter', 'indent' }
      end
    })
    vim.keymap.set("n", "zR", require("ufo").openAllFolds)
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
  end
}
