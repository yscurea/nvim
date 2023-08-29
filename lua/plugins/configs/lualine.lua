local navic = require("nvim-navic")

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

require("lualine").setup({
  options = {
    theme = "onedark",
  },
  sections = {
    lualine_a = {
      "mode",
    },
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
    lualine_x = { lsp_names() },
    lualine_y = { "encoding", "fileformat", "filetype" },
    lualine_z = { "progress", "location" },
  },
  -- OR in winbar
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
  },
})
