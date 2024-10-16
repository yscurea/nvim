return {
  "akinsho/bufferline.nvim",
  lazy = true,
  event = "BufAdd",
  keys = {
    { "<s-Tab>",   "<cmd>BufferLineCyclePrev<CR>", desc = "Next buffer",      mode = "n" },
    { "<Tab>",     "<cmd>BufferLineCycleNext<CR>", desc = "Prev buffer",      mode = "n" },
    { "<Leader><", "<cmd>BufferLineMovePrev<CR>",  desc = "Buffer move prev", mode = "n" },
    { "<Leader>>", "<cmd>BufferLineMoveNext<CR>",  desc = "Buffer move next", mode = "n" },
    { "<Leader>b", "<cmd>BufferLinePick<CR>",      desc = "Select buffer",    mode = "n" },
  },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        offsets = {
          {
            filetype = "NvimTree",
            text = "🌳 Nvim Tree 🌳",
            highlight = "Directory",
            text_align = "left",
          },
        },
        separator_style = "thick",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, _, _)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
      },
    })
  end,
}
