return {
  "ahmedkhalf/project.nvim",
  lazy = true,
  cond = function()
    return vim.g.vscode == nil
  end,
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("project_nvim").setup({})
    require("telescope").load_extension("projects")
  end,
}
