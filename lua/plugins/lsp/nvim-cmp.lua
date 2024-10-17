return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  lazy = true,
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local function border(hl_name)
      return {
        { "╭", hl_name },
        { "─", hl_name },
        { "╮", hl_name },
        { "│", hl_name },
        { "╯", hl_name },
        { "─", hl_name },
        { "╰", hl_name },
        { "│", hl_name },
      }
    end

    require('luasnip.loaders.from_vscode').lazy_load({ paths = { "~/.config/nvim/my_snippets" } })

    local lspkind = require("lspkind")
    local options = {
      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol_text',
          maxwidth = 50,
          ellipsis_char = '...',
          show_labelDetails = true,
          before = function(_, vim_item)
            return vim_item
          end
        }),
      },
      completion = {
        completeopt = "menu,menuone",
      },
      window = {
        documentation = {
          border = border("CmpDocBorder"),
        },
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<Up>"] = cmp.mapping.select_prev_item(),
        ["<Down>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        }),
        ["<Tab>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        }),
        ["<C-j>"] = cmp.mapping(function(fallback)
            if require("luasnip").expand_or_jumpable() then
              require("luasnip").expand_or_jump()
            else
              fallback()
            end
          end,
          { "i", "s" }
        )
      },
      sources = {
        { name = "nvim_lsp", max_item_count = 30 },
        { name = "luasnip",  max_item_count = 30 },
        { name = "buffer",   max_item_count = 30 },
        { name = "path",     max_item_count = 30 },
        { name = "cmdline",  option = { ignore_cmds = { "Man", "!" } } },
      },
    }
    require("cmp").setup(options)
  end,
}
