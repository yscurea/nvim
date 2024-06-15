-- 下に各種情報表示
return {
  "nvim-lualine/lualine.nvim",
  event = "CursorMoved",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "SmiteshP/nvim-navic",
  },
  lazy = true,
  config = function()
    local clients_lsp = function()
      local clients = {}
      for _, client in ipairs(vim.lsp.get_active_clients { bufnr = 0 }) do
        if client.name == 'null-ls' then
          local sources = {}
          for _, source in ipairs(require('null-ls.sources').get_available(vim.bo.filetype)) do
            table.insert(sources, source.name)
          end
          table.insert(clients, 'null-ls(' .. table.concat(sources, ', ') .. ')')
        else
          table.insert(clients, client.name)
        end
      end
      return ' ' .. table.concat(clients, ', ')
    end

    require("lualine").setup({
      options = {
        theme = "auto",
        disabled_filetypes = {
          statusline = { "packer", "NvimTree" },
          winbar = { "packer", "NvimTree" },
        }
      },
      sections = {
        lualine_a = { "mode" },
        lualine_x = { clients_lsp },
        lualine_y = { "fileformat", "filetype", "encoding" },
        lualine_z = { "progress", "location" },
      },
    })
  end,
}
