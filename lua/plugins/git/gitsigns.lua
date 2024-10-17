return {
  "lewis6991/gitsigns.nvim",
  lazy = true,
  event = "BufReadPost",
  cmd = { "Gitsigns" },
  keys = {
    { "<Leader>ghn", "<cmd>Gitsigns next_hunk<cr>",    mode = { "n" }, desc = "git next hunk" },
    { "<Leader>ghp", "<cmd>Gitsigns prev_hunk<cr>",    mode = { "n" }, desc = "git prev hunk" },
    { "<Leader>grh", "<cmd>Gitsigns reset_hunk<cr>",   mode = { "n" }, desc = "git reset hunk" },
    { "<Leader>grb", "<cmd>Gitsigns reset_buffer<cr>", mode = { "n" }, desc = "git reset buffer" },
    { "<Leader>gb",  "<cmd>Gitsigns blame_line<cr>",   mode = { "n" }, desc = "git blame line" },
  },
  config = function()
    require("gitsigns").setup({
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "│" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "│" },
      },
      on_attach = function()
        -- require("core.utils").load_mappings("gitsigns", { buffer = bufnr })
      end,
    })
  end,
}
