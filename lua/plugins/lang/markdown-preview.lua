return {
  "kat0h/bufpreview.vim",
  cmd = { "PreviewMarkdown", "PreviewMarkdownStop", "PreviewMarkdownToggle" },
  ft = { "markdown" },
  cond = function()
    return vim.g.vscode == nil
  end,
  dependencies = {
    "vim-denops/denops.vim",
  },
  build = "deno task prepare",
  lazy = true,
}
