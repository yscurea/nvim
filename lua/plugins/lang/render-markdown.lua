return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		opts = { file_types = { "markdown", "Avante" } },
		ft = { "markdown", "Avante" },
	},
	{
		"HakonHarnes/img-clip.nvim",
		lazy = true,
		ft = { "markdown" },
		opts = {
			default = {
				embed_image_as_base64 = false,
				prompt_for_file_name = false,
				drag_and_drop = {
					insert_mode = true,
				},
				use_absolute_path = true,
			},
		},
	},
}
