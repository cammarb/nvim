print("Neovim config")

require("config.lazy")

local set = vim.opt

set.shiftwidth = 2
set.expandtab = true
set.number = true
set.relativenumber = true

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
