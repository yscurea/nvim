-- プラグインの羅列
local plugins = {
  { -- 構成ファイルを編集したときにリロードするため
    "nvim-lua/plenary.nvim",
    lazy = false,
  },

  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    config = function()
      require("plugins.configs.nvim-web-devicons")
    end,
  },

  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme catppuccin]])
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
    cmd = { "NvimTreeOpen", "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFile" },
    init = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      vim.opt.termguicolors = true
      local mappings = require("plugins.mappings.nvim-tree")
      require("core.utils").load_mappings(mappings)
    end,
    config = function()
      local options = require("plugins.configs.nvim-tree")
      require("nvim-tree").setup(options)
    end,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },

  { -- 構文解析によるハイライト
    -- INFO: gccに依存している、適宜インストール
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
      { -- INFO: アーカイブ化されていることに注意
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
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope-ui-select.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
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
    event = "CursorMoved",
  },

  { -- カーソル以下と同じ単語をハイライト
    "RRethy/vim-illuminate",
    event = "CursorMoved",
  },

  { -- カラーコードなどを色づけしてくれる
    "norcalli/nvim-colorizer.lua",
    cmd = "ColorizerToggle",
    config = true,
  },

  { -- TODO などのコメントを色付け、telescopeで検索可能にする
    "folke/todo-comments.nvim",
    cmd = "TodoTelescope",
    dependencies = { "nvim-lua/plenary.nvim" },
    init = function()
      require("core.utils").load_mappings(require("plugins.mappings.todo-comments"))
    end,
    config = true,
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
      {
        "rcarriga/nvim-notify",
        config = function()
          require("notify").setup({
            render = "compact",
          })
        end,
      },
    },
    config = function()
      require("plugins.configs.noice")
    end,
  },

  {
    "aznhe21/actions-preview.nvim",
    config = function()
      vim.keymap.set({ "v", "n" }, "<leader>fc", require("actions-preview").code_actions)
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
    config = function()
      require("dap-python").setup("poetry run python")
    end,
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
    event = "CursorMoved",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      {
        "SmiteshP/nvim-navic",
        event = "CursorMoved",
        config = function()
          require("plugins.configs.nvim-navic")
        end,
      },
    },
    config = function()
      require("plugins.configs.lualine")
    end,
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

  {
    "kazhala/close-buffers.nvim",
    key = { "<leader>x", "<leader>X" },
    init = function()
      local mappings = require("plugins.mappings.close-buffers")
      require("core.utils").load_mappings(mappings)
    end,
    config = function()
      require("close_buffers").setup()
    end,
  },

  { -- markした行を行番号の左にサイン
    "chentoast/marks.nvim",
    keys = { "m" },
    config = true,
  },

  { -- スクロールバーを表示
    "petertriho/nvim-scrollbar",
    event = "CursorMoved",
    dependencies = {
      { "kevinhwang91/nvim-hlslens" },
      { "lewis6991/gitsigns.nvim" },
    },
    config = function()
      require("gitsigns").setup({})
      require("scrollbar").setup({})
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
      require("flutter-tools").setup()
    end,
  },

  {
    "dart-lang/dart-vim-plugin",
    ft = "dart",
  },

  { -- mdのテーブルを楽に書く
    "dhruvasagar/vim-table-mode",
    ft = "md",
  },

  {
    "MunifTanjim/prettier.nvim",
    event = "LspAttach",
    ft = "md",
    dependencies = {
      "neovim/nvim-lspconfig",
      "jose-elias-alvarez/null-ls.nvim",
    },
    config = true,
  },
}

return plugins
