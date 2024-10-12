-- LSP設定集
local mappings = {
  n = {
    ["<Leader>rn"] = {
      "<cmd>Lspsaga rename<CR>",
      "LSP rename"
    },

    ["gD"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "LSP declaration",
    },

    ["gd"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "LSP definition",
    },

    ["K"] = {
      "<cmd>Lspsaga hover_doc<CR>",
      "LSP hover",
    },

    ["gi"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "LSP implementation",
    },

    ["<Leader>ls"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "LSP signature help",
    },

    ["<Leader>D"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "LSP definition type",
    },

    ["<Leader>a"] = {
      "<cmd>Lspsaga code_action<CR>",
      "LSP code action",
    },

    ["gr"] = {
      function()
        vim.lsp.buf.references()
      end,
      "LSP references",
    },

    ["<Leader>fl"] = {
      function()
        vim.diagnostic.open_float({ border = "rounded" })
      end,
      "Floating diagnostic",
    },

    ["<Leader>fj"] = {
      -- function()
      --   vim.diagnostic.goto_next({ float = { border = "rounded" } })
      -- end,
      "<cmd>Lspsaga diagnostic_jump_next<CR>",
      "Goto next",
    },

    ["<Leader>fk"] = {
      -- function()
      --   vim.diagnostic.goto_prev({ float = { border = "rounded" } })
      -- end,
      "<cmd>Lspsaga diagnostic_jump_prev<CR>",
      "Goto prev",
    },

    ["<Leader>Q"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "Diagnostic setloclist",
    },

    ["<Leader>woa"] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "Add workspace folder",
    },

    ["<Leader>wor"] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "Remove workspace folder",
    },

    ["<Leader>wol"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "List workspace folders",
    },

    ["<Leader>FF"] = {
      function()
        vim.lsp.buf.format()
      end,
      "format",
    }
  },
}

return {
  "neovim/nvim-lspconfig",
  event = "BufReadPost",
  lazy = true,
  config = function()
    require("neoconf")
    local navic = require("nvim-navic")
    local navbuddy = require("nvim-navbuddy")
    local border = {
      { "╭", "FloatBorder" },
      { "─", "FloatBorder" },
      { "╮", "FloatBorder" },
      { "│", "FloatBorder" },
      { "╯", "FloatBorder" },
      { "─", "FloatBorder" },
      { "╰", "FloatBorder" },
      { "│", "FloatBorder" },
    }
    local handlers = {
      ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
      ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
    }

    local on_attach = function(client, bufnr)
      if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
        navbuddy.attach(client, bufnr)
      end
      require("core.utils").load_mappings(mappings, { buffer = bufnr })
    end

    local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

    require("lspconfig").efm.setup({
      on_attach = on_attach,
      handlers = handlers,
      init_options = {
        documentFormatting = true,
      },
      filetypes = {
        "lua",
        "python",
        "markdown",
      },
      settings = {
        rootMakers = { ".git/" },
        language = {
          lua = {},
          python = {},
          markdown = {},
        }
      },
    })

    require("lspconfig").ruff_lsp.setup {
      handlers = handlers,
      on_attach = on_attach,
      init_options = {
        settings = {
          args = {},
        }
      }
    }

    require("lspconfig").lua_ls.setup({
      capabilities = lsp_capabilities,
      on_attach = on_attach,
      handlers = handlers,
      settings = {
        Lua = {}
      }
    })

    require("lspconfig").terraformls.setup {
      capabilities = lsp_capabilities,
      on_attach = on_attach,
      handlers = handlers,
    }

    require("lspconfig").pyright.setup({
      capabilities = lsp_capabilities,
      handlers = handlers,
      settings = {
        pyright = {
          -- disableOrganizeImports = false,
        },
        python = {
          analysis = {
            ignore = { '*' },
            typeCheckingMode = "strict",
          }
        }
      },
      on_attach = on_attach
    })

    require("lspconfig").typos_lsp.setup({
      capabilities = lsp_capabilities,
      handlers = handlers,
    })

    require("lspconfig").marksman.setup({
      capabilities = lsp_capabilities,
      handlers = handlers,
      on_attach = on_attach,
    })

    require("lspconfig").gopls.setup({
      capabilities = lsp_capabilities,
      handlers = handlers,
      on_attach = on_attach,
    })

    require("lspconfig").biome.setup({
      capabilities = lsp_capabilities,
      handlers = handlers,
      on_attach = on_attach,
      single_file_support = true,
      filetypes = {
        "javascript",
        "javascriptreact",
        "json",
        "jsonc",
        "typescript",
        "typescript.tsx",
        "typescriptreact",
        "astro",
        "svelte",
        "vue",
        "css",
      }
    })

    vim.api.nvim_create_autocmd(
      { "BufWritePre" },
      {
        callback = function()
          vim.lsp.buf.format()
        end
      }
    )
  end
}
