if vim.g.vscode then
  require("core.vscode_options")
  local mappings = require("core.vscode_mappings")
  require("core.utils").load_mappings(mappings)
  require("core.vscode_plugin_setup")
else
  require("core.options")
  local mappings = require("core.mappings")
  require("core.utils").load_mappings(mappings)
  require("core.plugin_setup")
end
