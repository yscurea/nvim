-- LSP関係についてはよくまとまっているサイトがある： https://zenn.dev/futsuuu/articles/3b74a8acec166e

-- mason setup
require("mason").setup({
  ensure_installed = { "lua" },
  install_root_dir = vim.fn.stdpath("data") .. "/mason",
  PATH = "prepend",
  ui = {
    icons = {
      package_pending = " ",
      package_installed = "󰄳 ",
      package_uninstalled = " 󰚌",
    },
    keymaps = {
      toggle_server_expand = "<CR>",
      install_server = "i",
      update_server = "u",
      check_server_version = "c",
      update_all_servers = "U",
      check_outdated_servers = "C",
      uninstall_server = "X",
      cancel_installation = "<C-c>",
    },
  },
  max_concurrent_installers = 4,
})

-- null-ls setup
local null_ls = require("null-ls")
local sources = {
  -- for lua
  null_ls.builtins.formatting.stylua,
  -- for python
  null_ls.builtins.formatting.ruff,
  null_ls.builtins.formatting.black,
  null_ls.builtins.diagnostics.mypy,
  -- for js
  null_ls.builtins.diagnostics.eslint,

  -- for all
  null_ls.builtins.completion.spell,
  -- null_ls.builtins.diagnostics.cspell.with({
  --   diagnostics_postprocess = function(diagnostic)
  --     -- レベルをWARNに変更（デフォルトはERROR）
  --     diagnostic.severity = vim.diagnostic.severity["WARN"]
  --   end,
  --   condition = function()
  --     -- cspellが実行できるときのみ有効
  --     return vim.fn.executable('cspell') > 0
  --   end
  -- })
}
null_ls.setup({ sources = sources })

-- mason-lspconfig setup
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "rust_analyzer" },
})
local utils = require("core.utils")
local mappings = require("plugins.mappings.lsp")
local navic = require("nvim-navic")
local navbuddy = require("nvim-navbuddy")
local format_augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_clear_autocmds({ group = format_augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = format_augroup,
      buffer = bufnr,
      callback = function()
        -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
        -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
        -- vim.lsp.buf.formatting_sync()
        vim.lsp.buf.format({ async = false })
      end,
    })
  end
  -- client.server_capabilities.documentFormattingProvider = false
  -- client.server_capabilities.documentRangeFormattingProvider = false
  utils.load_mappings(mappings, { buffer = bufnr })
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
    navbuddy.attach(client, bufnr)
  end
end

-- lsp server 設定
require("mason-lspconfig").setup_handlers({
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup({
      on_attach = on_attach,
    })
  end,
  -- Next, you can provide a dedicated handler for specific servers.
  -- For example, a handler override for the `rust_analyzer`:
  -- ["rust_analyzer"] = function ()
  --     require("rust-tools").setup {}
  -- end
})
