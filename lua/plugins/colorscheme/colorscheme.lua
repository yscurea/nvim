return {
  {
    "daschw/leaf.nvim",
    lazy = true,
    config = function()
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
          NavicIconsFile = { fg = "#5d618c" },
          NavicIconsModule = { fg = "#9a4642" },
          NavicIconsNamespace = { fg = "#9997ae" },
          NavicIconsPackage = { fg = "#9a4642" },
          NavicIconsClass = { fg = "#eb6644" },
          NavicIconsMethod = { fg = "#f29944" },
          NavicIconsProperty = { fg = "#eab947" },
          NavicIconsField = { fg = "#eab947" },
          NavicIconsConstructor = { fg = "#eb6644" },
          NavicIconsEnum = { fg = "#eb6560" },
          NavicIconsInterface = { fg = "#eb6644" },
          NavicIconsFunction = { fg = "#f29944" },
          NavicIconsVariable = { fg = "#eab947" },
          NavicIconsConstant = { fg = "#eab947" },
          NavicIconsString = { fg = "#eab947" },
          NavicIconsNumber = { fg = "#eab947" },
          NavicIconsBoolean = { fg = "#eab947" },
          NavicIconsArray = { fg = "#eab947" },
          NavicIconsObject = { fg = "#eab947" },
          NavicIconsKey = { fg = "#eab947" },
          NavicIconsNull = { fg = "#eab947" },
          NavicIconsEnumMember = { fg = "#eab947" },
          NavicIconsStruct = { fg = "#eb6560" },
          NavicIconsEvent = { fg = "#85accf" },
          NavicIconsOperator = { fg = "#925e88" },
          NavicIconsTypeParameter = { fg = "#eab947" },
          NavicText = { link = "Title" },
          NavicSeparator = { fg = "#cf635f" },
        },
        theme = "dark",    -- default, based on vim.o.background, alternatives: "light", "dark"
        contrast = "high", -- default, alternatives: "medium", "high"
      })
      vim.cmd("colorscheme leaf")
    end,
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
  },
  {
    "Mofiqul/dracula.nvim",
    lazy = true,
  },
  {
    "luisiacc/gruvbox-baby",
    lazy = true,
    config = function()
      require('gruvbox').setup()
      vim.cmd("colorscheme gruvbox")
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    config = function()
      require("kanagawa").setup()
      vim.cmd("colorscheme kanagawa-lotus")
    end,
  },
  {
    "marko-cerovac/material.nvim",
    lazy = true,
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = true,
  },
  {
    "olimorris/onedarkpro.nvim",
    lazy = false,
    config = function()
      vim.cmd [[colorscheme onedark]]
    end,
  },
  {
    "rose-pine/neovim",
    lazy = true,
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000,
    -- opts = {},
    -- config = function()
    --   vim.cmd [[colorscheme tokyonight]]
    -- end,
  },
  {
    "Mofiqul/vscode.nvim",
    lazy = true,
  },
}
