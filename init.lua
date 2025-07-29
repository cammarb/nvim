require("config.lazy")

local global = vim.g
local set = vim.o
local keymap = vim.keymap

global.mapleader = " "

set.shiftwidth = 2
set.expandtab = true
set.number = true
set.relativenumber = true
set.termguicolors = true
set.swapfile = false

vim.api.nvim_create_autocmd({"VimEnter", "VimResume"}, {
  callback = function()
    vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon0"
  end
})

vim.api.nvim_create_autocmd({"VimLeave", "VimSuspend"}, {
  callback = function()
    vim.opt.guicursor = "a:ver25-blinkon250"
  end
})

keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")
