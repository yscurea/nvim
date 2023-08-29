-- pluginの読み込みには lazy.nvim を使用する
-- lazy.nvimがなければインストール
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

local plugins = require("plugins.plugin_list")
local lazy_nvim_config = require("plugins.configs.lazy_nvim")

require("lazy").setup(plugins, lazy_nvim_config.options)
