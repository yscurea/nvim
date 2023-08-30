-- プラグインの羅列
local plugins = {
  { -- 構成ファイルを編集したときにリロードするため
    "nvim-lua/plenary.nvim",
    lazy = false,
  },

  { -- カラーテーマ
    "navarasu/onedark.nvim",
    cond = false,
    event = "VimEnter",
    config = function()
      require("onedark").load()
    end,
  },

  { -- カラーテーマ
    "rmehri01/onenord.nvim",
    -- event = "VimEnter",
    cond = false,
    config = true,
  },

  {
    "sainnhe/sonokai",
    event = "VimEnter",
    config = function()
      vim.cmd([[colorscheme sonokai]])
    end,
  },

  { -- キーマップのヒント表示
    "folke/which-key.nvim",
    keys = { "<leader>", '"', "'", "`", "c", "v", "g" },
    init = function()
      require("core.utils").load_mappings(require("plugins.mappings.which_key"))
    end,
    config = function()
      require("which-key").setup({})
    end,
  },

  { -- ファイルツリー
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeOpen", "NvimTreeToggle", "NvimTreeFocus" },
    init = function()
      local mappings = require("plugins.mappings.nvim_tree")
      require("core.utils").load_mappings(mappings)
    end,
    config = function()
      local options = require("plugins.configs.nvim_tree")
      require("nvim-tree").setup(options)
    end,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },

  { -- 構文解析によるハイライト
    -- INFO: windowsではgccに依存している、適宜インストール
    "nvim-treesitter/nvim-treesitter",
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      local options = require("plugins.configs.treesitter")
      require("nvim-treesitter.configs").setup(options)
    end,
  },

  { -- インデントとか終端文字とかの表示の調節する
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPost",
    opts = function()
      local mappings = require("plugins.mappings.blankline")
      require("core.utils").load_mappings(mappings)
    end,
    config = function()
      local config = require("plugins.configs.blankline")
      require("indent_blankline").setup(config)
    end,
  },

  { -- git の見た目
    "lewis6991/gitsigns.nvim",
    ft = { "gitcommit", "diff" },
    config = function()
      local options = require("plugins.configs.gitsigns")
      require("gitsigns").setup(options)
    end,
  },

  { -- LSP
    "williamboman/mason-lspconfig.nvim",
    event = "BufReadPost",
    dependencies = {
      "neovim/nvim-lspconfig",
      {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
      },
      {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
      },
      {
        "SmiteshP/nvim-navic",
        config = function()
          require("plugins.configs.nvim-navic")
        end,
      },
      {
        "SmiteshP/nvim-navbuddy",
        dependencies = {
          "SmiteshP/nvim-navic",
          "MunifTanjim/nui.nvim",
        },
        opts = { lsp = { auto_attach = true } },
      },
    },
    config = function()
      require("plugins.configs.lsp")
    end,
  },

  { -- 補完機能
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        -- スニペット
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        config = function(_, opts)
          require("plugins.configs.lua_snip").luasnip(opts)
        end,
      },

      -- 括弧を書いたら閉じ括弧も自動挿入する (){}[] etc
      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)

          -- setup cmp for autopairs
          local cmp_autopairs = require("nvim-autopairs.completion.cmp")
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },

      -- 補完するときのソース
      {
        "saadparwaiz1/cmp_luasnip",
        -- "hrsh7th/cmp-vsnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-path",
        "hrsh7th/nvim-cmp",
        "onsails/lspkind.nvim",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        -- "folke/neodev.nvim", -- neovim開発者は入れておくといい
        -- {'rafamadriz/friendly-snippets', event = 'InsertEnter'},
      },
    },
    config = function()
      require("plugins.configs.cmp")
    end,
  },

  { -- コメントアウトショートカット
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", mode = "n",          desc = "Comment toggle current line" },
      { "gc",  mode = { "n", "o" }, desc = "Comment toggle linewise" },
      { "gc",  mode = "x",          desc = "Comment toggle linewise (visual)" },
      { "gbc", mode = "n",          desc = "Comment toggle current block" },
      { "gb",  mode = { "n", "o" }, desc = "Comment toggle blockwise" },
      { "gb",  mode = "x",          desc = "Comment toggle blockwise (visual)" },
    },
    init = function()
      require("core.utils").load_mappings(require("plugins.mappings.comment"))
    end,
    config = function()
      require("Comment").setup({})
    end,
  },

  { -- 色々検索ツール
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    init = function()
      require("core.utils").load_mappings(require("plugins.mappings.telescope"))
    end,
    config = function()
      require("plugins.configs.telescope")
    end,
    dependencies = {
      "nvim-telescope/telescope-live-grep-args.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
      "nvim-telescope/telescope-ui-select.nvim",
    },
  },

  { -- カーソル加速
    "rhysd/accelerated-jk",
    event = "CursorMoved",
    config = function()
      require("core.utils").load_mappings(require("plugins.mappings.accelerate_jk"), { silent = true })
    end,
  },

  { -- 空白飛ばし上下移動
    "haya14busa/vim-edgemotion",
    event = "CursorMoved",
    -- keys = { "<leader>J", "<leader>K" }, -- FIXME: なぜか効かない、要修正
    init = function()
      require("core.utils").load_mappings(require("plugins.mappings.vim-edgemotion"))
    end,
  },

  { -- f ジャンプで一回で飛べる位置を色づけ
    "unblevable/quick-scope",
    event = "BufReadPost",
  },

  { -- カーソル以下と同じ単語をハイライト
    "RRethy/vim-illuminate",
    event = "BufReadPost",
  },

  { -- カラーコードなどを色づけしてくれる
    "norcalli/nvim-colorizer.lua",
    cmd = "ColorizerToggle",
    config = true,
  },

  { -- TODO などのコメントを色付け、telescopeで検索可能にする
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  { -- コードの問題点を一覧で表示
    "folke/trouble.nvim",
    cmd = { "TroubleToggle" },
    init = function()
      require("core.utils").load_mappings(require("plugins.mappings.trouble"))
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = true,
  },

  { -- デフォルトのより早いfiletype
    "nathom/filetype.nvim",
    event = "VimEnter",
    init = function()
      vim.g.did_load_filetypes = 1
    end,
    config = function()
      require("filetype").setup({})
    end,
  },

  {
    "ahmedkhalf/project.nvim",
    lazy = true,
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("project_nvim").setup({})
      require("telescope").load_extension("projects")
    end,
  },

  { -- リッチな通知とコマンドラインの中央表示
    "folke/noice.nvim",
    keys = { ":" },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        messages = {
          view_search = "mini",
        },
      })
    end,
  },

  { -- カーソル移動をどこでも一発で
    "phaazon/hop.nvim",
    branch = "v2",
    cmd = { "HopWord", "HopVertical" },
    init = function()
      require("core.utils").load_mappings(require("plugins.mappings.hop"))
    end,
    config = function()
      require("hop").setup({})
    end,
  },

  { -- デバッグ
    "mfussenegger/nvim-dap",
    key = { "<F5>", "<F10>", "<F11>", "<F12>", "<leader>bb", "<leader>B", "<leader>lp", "<leader>dr", "<leader>dl" },
    init = function()
      local loader = require("core.utils")
      loader.load_mappings(require("plugins.mappings.nvim-dap"))
      loader.load_mappings(require("plugins.mappings.nvim-dap-ui"))
    end,
    dependencies = {
      "rcarriga/nvim-dap-ui",
    },
  },

  { -- python デバッグ
    "mfussenegger/nvim-dap-python",
    key = { "<F5>", "<F10>", "<F11>", "<F12>", "<leader>bb", "<leader>B", "<leader>lp", "<leader>dr", "<leader>dl" },
    dependencies = {
      "mfussenegger/nvim-dap",
    },
  },

  { -- マルチカーソル
    "mg979/vim-visual-multi",
    event = "CursorMoved",
  },

  { -- 括弧編集強化
    "tpope/vim-surround",
    event = "BufReadPost",
  },

  { -- 名前のcase変換
    "arthurxavierx/vim-caser",
    keys = { "gsm", "gsc", "gs_", "gsu", "gst", "gss", "gs<space>", "gs-", "gsk", "gsK", "gs." },
  },

  { -- 下に各種情報表示
    "nvim-lualine/lualine.nvim",
    event = "BufReadPost",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "navarasu/onedark.nvim",
      {
        "SmiteshP/nvim-navic",
        config = function()
          require("plugins.configs.nvim-navic")
        end,
      },
    },
    config = true,
  },

  { -- bufferを画面上部に表示
    "akinsho/bufferline.nvim",
    version = "*",
    event = "BufAdd",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    init = function()
      vim.opt.termguicolors = true
    end,
    config = function()
      local mappings = require("plugins.mappings.bufferline")
      require("core.utils").load_mappings(mappings)
      require("plugins.configs.bufferline")
    end,
  },

  { -- markした行を行番号の左にサイン
    "chentoast/marks.nvim",
    keys = { "m" },
    config = true,
  },

  { -- スクロールバーを表示
    "petertriho/nvim-scrollbar",
    event = "BufReadPost",
    dependencies = {
      { "kevinhwang91/nvim-hlslens" },
      { "lewis6991/gitsigns.nvim" },
    },
    config = function()
      require("gitsigns").setup({})
      require("scrollbar.handlers.gitsigns").setup({})
      require("scrollbar.handlers.search").setup({})
    end,
  },

  { -- insert modeで行数を絶対値に
    "myusuf3/numbers.vim",
    event = "InsertEnter",
    init = function()
      require("plugins.configs.numbers")
    end,
  },

  { -- ターミナルを使いやすくする
    "akinsho/toggleterm.nvim",
    version = "*",
    cmd = { "ToggleTerm" },
    init = function()
      require("core.utils").load_mappings(require("plugins.mappings.toggleterm"))
    end,
    config = true,
  },

  { -- Rust開発環境用
    "simrat39/rust-tools.nvim",
    ft = { "rs" },
  },

  { -- Flutterのコマンドバインディング
    "akinsho/flutter-tools.nvim",
    cmd = {
      "FlutterRun",
      "FlutterDevices",
      "FlutterEmulators",
      "FlutterReload",
      "FlutterRestart",
      "FlutterQuit",
      "FlutterDetach",
      "FlutterOutlineToggle",
      "FlutterOutlineOpen",
      "FlutterDevTools",
      "FlutterCopyProfilerUrl",
      "FlutterLspRestart",
      "FlutterSuper",
      "FlutterReanalyze",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("flutter-tools").setup({})
    end,
  },

  { -- mdのテーブルを楽に書く
    "dhruvasagar/vim-table-mode",
    ft = "md",
  },

  -- {
  --   "linux-cultist/venv-selector.nvim",
  --   dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
  --   ft = "py",
  --   keys = { {
  --     "<leader>vs",
  --     "<cmd>:VenvSelect<cr>",
  --     "<leader>vc",
  --     "<cmd>:VenvSelectCached<cr>",
  --   } },
  -- },
}

return plugins
