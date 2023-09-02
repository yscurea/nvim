return {
  n = {
    ["<s-Tab>"] = { "<cmd>BufferLineCyclePrev<CR>", "前バッファへ" },
    ["<Tab>"] = { "<cmd>BufferLineCycleNext<CR>", "次バッファへ" },
    ["<Leader>>"] = { "<cmd>BufferLineMoveNext<CR>", "バッファを右に移動" },
    ["<Leader><"] = { "<cmd>BufferLineMovePrev<CR>", "バッファを左に移動" },
    ["<Leader>b"] = { "<cmd>BufferLinePick<CR>", "バッファ選択" },
    ["<Leader>x"] = {
      "<cmd>bd<CR><cmd>bprev<CR>",
      "バッファを閉じる",
    },
  },
}
