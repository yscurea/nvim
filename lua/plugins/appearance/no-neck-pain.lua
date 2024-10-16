return {
  "shortcuts/no-neck-pain.nvim",
  version = "*",
  keys = {
    { "<Leader>z", "<cmd>NoNeckPain<CR>", mode = { "n" }, desc = "Centering Buffers" },
    -- { "",          mode = { "n" },        desc = "NoNeckPainResize" },
    -- { "",          mode = { "n" },        desc = "NoNeckPainToggleLeftSide" },
    -- { "",          mode = { "n" },        desc = "NoNeckPainToggleRightSide" },
    -- { "",          mode = { "n" },        desc = "NoNeckPainWidthUp" },
    -- { "",          mode = { "n" },        desc = "NoNeckPainWidthDown" },
    -- { "",          mode = { "n" },        desc = "NoNeckPainScratchPad" },
  },
  cmd = {
    "NoNeckPain",
    "NoNeckPainResize",
    "NoNeckPainToggleLeftSide",
    "NoNeckPainToggleRightSide",
    "NoNeckPainWidthUp",
    "NoNeckPainWidthDown",
    "NoNeckPainScratchPad",
  },
}
