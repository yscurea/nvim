return {
	"vinnymeller/swagger-preview.nvim",
	build = "npm install -g swagger-ui-watcher",
	lazy = true,
	cmd = { "SwaggerPreview", "SwaggerPreviewStop", "SwaggerPreviewToggle" },
	config = function()
		require("swagger-preview").setup({
			port = 8000,
			host = "localhost",
		})
	end,
}
