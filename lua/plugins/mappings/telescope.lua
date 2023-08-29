return {
  n = {
    -- find
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "ファイル検索" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "全検索" },
    ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "単語検査" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "バッファ検索" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "ヘルプページ検索" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "oldファイル検索" },
    ["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "現在のバッファ内検索" },

    -- git
    ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "Git status" },

    -- theme switcher
    -- ["<leader>th"] = { "<cmd> Telescope themes <CR>", "themes" },

    ["<leader>fm"] = { "<cmd> Telescope marks <CR>", "ブクマ検索" },
  },
}
