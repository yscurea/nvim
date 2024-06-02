return {
	"arthurxavierx/vim-caser",
	lazy = true,
	keys = {
		{ "gsm", mode = { "n" }, desc = "to UpperCamelCase" },
		{ "gsc", mode = { "n" }, desc = "to camelCase" },
		{ "gs_", mode = { "n" }, desc = "to snake_case" },
		{ "gsu", mode = { "n" }, desc = "to UPPER_CASE" },
		{ "gst", mode = { "n" }, desc = "to Title Case" },
		{ "gss", mode = { "n" }, desc = "to Sentence case" },
		{ "gs<space>", mode = { "n" }, desc = "to space case" },
		{ "gs-", mode = { "n" }, desc = "to kebab-case" },
		{ "gsk", mode = { "n" }, desc = "to kebab-case" },
		{ "gsK", mode = { "n" }, desc = "to Title-Kebab-Case" },
		{ "gs.", mode = { "n" }, desc = "to dot.case" },
	},
}
