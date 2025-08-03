local global = vim.g
local opt = vim.opt
local keymap = vim.keymap
local api = vim.api

global.mapleader = " "
global.maplocleader = "\\"

opt.shiftwidth = 2
opt.expandtab = true
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.swapfile = false
opt.winborder = "rounded"

-- Recover terminal's cursor type
api.nvim_create_autocmd({ "VimLeave", "VimSuspend" }, {
  callback = function()
    opt.guicursor = "a:block-blink"
  end,
})

keymap.set("n", "<leader>o", ":update<CR> :source<CR>")
keymap.set("n", "<leader>w", ":write<CR>")
keymap.set("n", "<leader>q", ":quit<CR>")

require("config.lazy")

-- Set transparent background for the statusline
vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = 'NONE' })

-- LSP
vim.lsp.enable('luals')
vim.lsp.enable('kotlin_lsp')
