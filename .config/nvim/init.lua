require("core.keymaps")
require("core.plugins")
require("core.plugin_config")


vim.opt.number = true
vim.opt.relativenumber = true
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})
