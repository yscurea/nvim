-- git の見た目
local options = {
  signs = {
    add = { text = "│" },
    change = { text = "│" },
    delete = { text = "󰍵" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
    untracked = { text = "│" },
  },
  on_attach = function()
    -- require("core.utils").load_mappings("gitsigns", { buffer = bufnr })
  end,
}

return {
  "lewis6991/gitsigns.nvim",
  lazy = true,
  ft = { "gitcommit", "diff" },
  cond = function()
    return vim.g.vscode == nil
  end,
  config = function()
    require("gitsigns").setup(options)
  end,
}
