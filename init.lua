vim.global.mapleader = " "
vim.global.maplocleader = "\\"

vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.swapfile = false
vim.opt.winborder = "rounded"

-- Recover terminal's cursor type
vim.api.nvim_create_autocmd({ "VimLeave", "VimSuspend" }, {
  callback = function()
    vim.opt.guicursor = "a:block-blink"
  end,
})

vim.keymap.set("n", "<leader>o", ":update<CR> :source<CR>")
vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":quit<CR>")

require("config.lazy")

-- Set transparent background for the statusline
vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = 'NONE' })

-- LSP
vim.lsp.enable('lua_ls')
vim.lsp.enable('kotlin_lsp')

