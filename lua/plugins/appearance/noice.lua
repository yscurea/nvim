-- リッチな通知とコマンドラインの中央表示
local routes = {
  {
    filter = {
      event = "msg_show",
    },
    view = "mini",
    opts = {
      relative = "editor", -- エディタ全体に対して相対的な位置
      position = "95%",    -- 画面の右下に表示するための位置指定
      size = {
        width = 50,        -- ポップアップの幅
        height = 1,        -- ポップアップの高さ
      },
      border = {
        style = "rounded",         -- ポップアップの境界線スタイル
        highlight = "FloatBorder", -- 境界線のハイライトグループ
      },
      win_options = {
        winblend = 10, -- ポップアップの透明度
      },
    },
  },
}

return {
  "folke/noice.nvim",
  keys = { ":" },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
    "nvim-telescope/telescope.nvim",
  },
  opts = function(_, opts)
    opts.routes = routes
    opts.notify = {
      enabled = true,
      view = "notify",
    }
    opts.messages = {
      enabled = true,              -- enables the Noice messages UI
      view = "notify",             -- default view for messages
      view_error = "notify",       -- view for errors
      view_warn = "notify",        -- view for warnings
      view_history = "messages",   -- view for :messages
      view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
    }
    opts.redirect = {
      view = "popup",
      filter = { event = "msg_show" },
    }
    opts.presets = {
      -- bottom_search = true,         -- use a classic bottom cmdline for search
      -- command_palette = true,       -- position the cmdline and popupmenu together
      -- long_message_to_split = true, -- long messages will be sent to a split
      -- inc_rename = false,           -- enables an input dialog for inc-rename.nvim
      -- lsp_doc_border = false,       -- add a border to hover docs and signature help
    }
  end,
  config = function(_, opts)
    require("noice").setup(opts)
    require("telescope").load_extension("notify")
  end,
}
