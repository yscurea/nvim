return {
  "daschw/leaf.nvim",
  lazy = false,
  event = "BufReadPost",
  priority = 1000,
  config = function()
    local leaf_colors = require("leaf.colors").setup()
    require("leaf").setup({
      underlineStyle = "underline",
      commentStyle = "italic",
      functionStyle = "NONE",
      keywordStyle = "italic",
      statementStyle = "bold",
      typeStyle = "NONE",
      variablebuiltinStyle = "italic",
      transparent = true,
      colors = {},
      overrides = {
        NavicIconsFile = { fg = leaf_colors.leaf_orange_0 },
        NavicIconsModule = { fg = leaf_colors.leaf_orange_1 },
        NavicIconsNamespace = { fg = leaf_colors.leaf_orange_2 },
        NavicIconsPackage = { fg = leaf_colors.leaf_orange_3 },
        NavicIconsClass = { fg = leaf_colors.leaf_orange_4 },
        NavicIconsMethod = { fg = leaf_colors.leaf_orange_5 },

        NavicIconsProperty = { fg = leaf_colors.leaf_teal_0 },
        NavicIconsField = { fg = leaf_colors.leaf_teal_1 },
        NavicIconsConstructor = { fg = leaf_colors.leaf_teal_2 },
        NavicIconsEnum = { fg = leaf_colors.leaf_teal_3 },
        NavicIconsInterface = { fg = leaf_colors.leaf_teal_4 },
        NavicIconsFunction = { fg = leaf_colors.leaf_teal_5 },

        NavicIconsVariable = { fg = leaf_colors.leaf_yellow_0 },
        NavicIconsConstant = { fg = leaf_colors.leaf_yellow_1 },
        NavicIconsString = { fg = leaf_colors.leaf_yellow_2 },
        NavicIconsNumber = { fg = leaf_colors.leaf_yellow_3 },
        NavicIconsBoolean = { fg = leaf_colors.leaf_yellow_4 },
        NavicIconsArray = { fg = leaf_colors.leaf_yellow_5 },

        NavicIconsObject = { fg = leaf_colors.leaf_blue_0 },
        NavicIconsKey = { fg = leaf_colors.leaf_blue_1 },
        NavicIconsNull = { fg = leaf_colors.leaf_blue_2 },
        NavicIconsEnumMember = { fg = leaf_colors.leaf_blue_3 },
        NavicIconsStruct = { fg = leaf_colors.leaf_blue_4 },
        NavicIconsEvent = { fg = leaf_colors.leaf_blue_5 },

        NavicIconsOperator = { fg = leaf_colors.leaf_green_0 },
        NavicIconsTypeParameter = { fg = leaf_colors.leaf_green_1 },
        NavicText = { fg = leaf_colors.leaf_light_0 },
        NavicSeparator = { fg = leaf_colors.leaf_light_1 },
      },
      theme = "dark",      -- default, based on vim.o.background, alternatives: "light", "dark"
      contrast = "medium", -- default, alternatives: "medium", "high"
    })
    vim.cmd("colorscheme leaf")
  end,
}
