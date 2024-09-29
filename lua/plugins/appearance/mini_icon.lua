return {
  "echasnovski/mini.icons",
  opts = {
    style              = 'glyph',

    default            = {},
    directory          = {},
    extension          = {},
    file               = {},
    filetype           = {},
    lsp                = {},
    os                 = {},

    use_file_extension = function(_, __)
      return true
    end,
  },
  lazy = true,
  specs = {
    { "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
  },
  init = function()
    package.preload["nvim-web-devicons"] = function()
      require("mini.icons").mock_nvim_web_devicons()
      return package.loaded["nvim-web-devicons"]
    end
  end,
}
