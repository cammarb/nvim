require("config.lazy")

local global = vim.g
local opt = vim.opt
local keymap = vim.keymap
local api = vim.api

global.mapleader = " "

opt.shiftwidth = 2
opt.expandtab = true
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.swapfile = false

api.nvim_create_autocmd({ "VimEnter", "VimResume" }, {
  callback = function()
    opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon0"
  end,
})

api.nvim_create_autocmd({ "VimLeave", "VimSuspend" }, {
  callback = function()
    opt.guicursor = "a:ver25-blinkon250"
  end,
})

keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")
