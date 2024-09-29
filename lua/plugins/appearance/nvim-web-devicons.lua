-- icon component
return {
  "nvim-tree/nvim-web-devicons",
  lazy = true,
  config = function()
    require("mini.icons")
    require("nvim-web-devicons").setup({
      override = {},
      color_icons = true,
      default = true,
      strict = true,
      override_by_filename = {
        [".gitignore"] = {
          icon = "",
          color = "#f1502f",
          name = "Gitignore",
        },
      },
      override_by_extension = {
        ["log"] = {
          icon = "",
          color = "#81e043",
          name = "Log",
        },
        ["yaml"] = {
          icon = "",
          color = "#f1502f",
          name = "Yaml",
        },
      },
    })
  end,
}
