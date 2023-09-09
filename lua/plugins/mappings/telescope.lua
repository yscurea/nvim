return {
  n = {
    -- find
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "ファイル検索" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "全検索" },
    ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "単語検査" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "バッファ検索" },
    ["<leader>fe"] = { "<cmd> Telescope file_browser <CR>", "ファイルブラウザ" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "ヘルプページ検索" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "oldファイル検索" },
    ["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "現在のバッファ内検索" },

    -- git
    ["<leader>fgc"] = { "<cmd> Telescope git_commits <CR>", "Git commits list" },
    ["<leader>fgt"] = { "<cmd> Telescope git_status <CR>", "Git status list" },
    ["<leader>fgy"] = { "<cmd> Telescope git_branches <CR>", "Git branches list" },

    -- colorscheme
    ["<leader>co"] = { "<cmd> Telescope colorscheme <CR>", "themes検索" },

    ["<leader>fm"] = { "<cmd> Telescope marks <CR>", "ブクマ検索" },
  },
}
