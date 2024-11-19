require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "isort" },
		-- Use a sub-list to run only the first available formatter
		cpp = { "clang_format" },
		js = { "prettier" },
		rust = { "rustfmt" },
		toml = { "taplo" },
		bash = { "shfmt" },
		css = { "prettier" },
		html = { "prettier" },
		r = { "jupytext" },
		rmd = { "mdsf" },
	},
})
