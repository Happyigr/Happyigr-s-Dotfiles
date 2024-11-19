require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"rust_analyzer",
		"clangd",
		"taplo",
		"pyright",
		"html",
		"cssls",
		"tailwindcss",
		"denols",
		"bashls",
		"arduino_language_server",
		"r_language_server",
	},
})

local on_attach = function(_, _)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
	vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, {})
	vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")

lspconfig.tailwindcss.setup({ ftp = "tcss", on_atatch = on_attach, capabilities = capabilities })
lspconfig.cssls.setup({ ftp = "css", on_atatch = on_attach, capabilities = capabilities })
lspconfig.html.setup({ ftp = "html", on_atatch = on_attach, capabilities = capabilities })
lspconfig.pyright.setup({ ftp = "python", on_atatch = on_attach, capabilities = capabilities })
lspconfig.lua_ls.setup({ ftp = "lua", on_attach = on_attach, capabilities = capabilities })
lspconfig.clangd.setup({ ftp = "cpp", on_attach = on_attach, capabilities = capabilities })
lspconfig.taplo.setup({ ftp = "toml", on_attach = on_attach, capabilities = capabilities })
lspconfig.denols.setup({ ftp = "js", on_attach = on_attach, capabilities = capabilities })
lspconfig.bashls.setup({ ftp = "sh", on_attach = on_attach, capabilities = capabilities })
lspconfig.arduino_language_server.setup({ ftp = "arduino", on_attach = on_attach, capabilities = capabilities })
lspconfig.r_language_server.setup({ ftp = { "r", "rmd" }, on_attach = on_attach, capabilities = capabilities })

-- local MY_FQBN = "arduino:avr:uno"
--
-- lspconfig.arduino_language_server.setup({
-- 	ftp = "arduino",
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	cmd = {
-- 		"arduino-language-server",
-- 		"-cli",
-- 		"usr/bin/arduino-cli",
-- 		"-cli-config",
-- 		"$HOME/.arduino15/arduino-cli.yaml",
-- 		"-clangd",
-- 		"/usr/bin/clangd",
-- 		"-fqbn",
-- 		MY_FQBN,
-- 	},
-- })
