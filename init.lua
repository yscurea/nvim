if vim.g.vscode == nil then
	require("core.options")
	require("core.plugin_setup")
	require("core.mappings")
	require("core.lsp")
else
	require("vscode_core.options")
	local mappings = require("vscode_core.mappings")
	require("core.utils").load_mappings(mappings)
	require("vscode_core.plugin_setup")
end
