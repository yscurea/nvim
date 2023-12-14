-- LSP関係についてはよくまとまっているサイトがある： https://zenn.dev/futsuuu/articles/3b74a8acec166e

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "single",
})

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
  null_ls.builtins.diagnostics.markdownlint,
  null_ls.builtins.formatting.prettier,
  null_ls.builtins.code_actions.cspell,
  null_ls.builtins.diagnostics.cspell.with({
    diagnostics_postprocess = function(diagnostic)
      -- レベルをWARNに変更（デフォルトはERROR）
      diagnostic.severity = vim.diagnostic.severity["WARN"]
    end,
    condition = function()
      -- cspellが実行できるときのみ有効
      return vim.fn.executable("cspell") > 0
    end,
  }),
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

utils.load_mappings(mappings)

local on_attach = function(client, bufnr)
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_clear_autocmds({ group = format_augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = format_augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })
  end
  navic.attach(client, bufnr)
  navbuddy.attach(client, bufnr)
end

-- LSP server 設定
require("mason-lspconfig").setup_handlers({
  function(server_name) -- デフォルトの設定
    require("lspconfig")[server_name].setup({
      on_attach = on_attach,
    })
  end,
  -- TODO: デフォルト以外の設定は個別に設定する
  -- ["rust_analyzer"] = function ()
  --     require("rust-tools").setup {}
  -- end
})
