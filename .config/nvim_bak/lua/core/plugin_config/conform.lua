function prettier_svelte_formatter()
	local plugin_path = vim.fn.resolve(
		vim.fn.stdpath("data") .. "/mason/packages/prettier/node_modules/prettier-plugin-svelte/plugin.js"
	)

	local formatter = require("conform.formatters.prettier")
	formatter.args = {
		"--plugin",
		plugin_path,
		"--stdin-filepath",
		"$FILENAME",
	}

	return formatter
end

require("conform").setup({
	lsp_fallback = true,
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
		svelte = { "prettier_svelte" },
		r = { "jupytext" },
		rmd = { "mdsf" },
	},
	formatters = {
		prettier_svelte = prettier_svelte_formatter(),
	},
})
