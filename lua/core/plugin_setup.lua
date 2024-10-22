local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazy_path) then
  print("start cloning lazy.nvim")
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazy_path,
  })
  print("cloning successfully")
end
vim.opt.rtp:prepend(lazy_path)

local lazy_config = require("core.lazy_nvim")

require("lazy").setup({
  { import = "plugins.appearance" },
  { import = "plugins.colorscheme" },
  { import = "plugins.editing" },
  { import = "plugins.finder" },
  { import = "plugins.git" },
  { import = "plugins.lang" },
  { import = "plugins.lsp" },
  { import = "plugins.operation" },
  { import = "plugins.others" },
  { import = "plugins.snippet" },
  -- { import = "plugins.ai" },
}, lazy_config)
