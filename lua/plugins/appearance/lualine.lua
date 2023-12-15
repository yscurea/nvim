-- 下に各種情報表示
local lsp_names = function()
  local clients = {}
  for _, client in ipairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
    if client.name == "null-ls" then
      local sources = {}
      for _, source in ipairs(require("null-ls.sources").get_available(vim.bo.filetype)) do
        table.insert(sources, source.name)
      end
      table.insert(clients, "null-ls(" .. table.concat(sources, ", ") .. ")")
    else
      table.insert(clients, client.name)
    end
  end
  return " " .. table.concat(clients, ", ")
end


return {
  "nvim-lualine/lualine.nvim",
  event = "CursorMoved",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "SmiteshP/nvim-navic",
  },
  config = function()
    local navic = require("nvim-navic")
    require("lualine").setup({
      options = {
        theme = "auto",
      },
      sections = {
        lualine_a = { "mode" },
        lualine_x = { lsp_names },
        lualine_y = { "fileformat", "filetype" },
        lualine_z = { "progress", "location" },
      },
      winbar = {
        lualine_c = {
          {
            function()
              return navic.get_location()
            end,
            cond = function()
              return navic.is_available()
            end,
          },
        },
        lualine_y = { "encoding" },
      },
    })
  end,
}
