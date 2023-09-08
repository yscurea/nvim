local options = {
  defaults = {
    prompt_prefix = "   ",
    mappings = {
      n = {
        ["q"] = require("telescope.actions").close,
        ["<c-t>"] = require("trouble.providers.telescope").open_with_trouble,
      },
      i = {
        ["<c-t>"] = require("trouble.providers.telescope").open_with_trouble,
      },
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    },
  },
  extensions = {
    ["themes"] = {},
    ["terms"] = {},
    ["ui-select"] = {
      require("telescope.themes").get_dropdown({}),
    },
    ["live_grep_args"] = {
      auto_quoting = true,
      mappings = {
        i = {
          ["<C-k>"] = require("telescope-live-grep-args.actions").quote_prompt(),
          ["<C-i>"] = require("telescope-live-grep-args.actions").quote_prompt({ postfix = " --iglob " }),
        },
      },
    },
    file_browser = {
      theme = "ivy",
      hijack_netrw = false,
      mappings = {
        -- INFO: custom mappings.
      },
    },
  },
}

telescope = require("telescope")

telescope.setup(options)

telescope.load_extension("file_browser")
telescope.load_extension("ui-select")
telescope.load_extension("live_grep_args")
