require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = {
		"c",
		"lua",
		"vim",
		"vimdoc",
		"query",
		"rust",
		"cpp",
		"python",
		"toml",
		"html",
		"css",
		"javascript",
		"typescript",
		"bash",
		"svelte",
	},

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,
	auto_install = true,

	highlight = {
		enable = true,
	},
})
